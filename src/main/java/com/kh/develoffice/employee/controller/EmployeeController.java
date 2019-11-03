package com.kh.develoffice.employee.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.develoffice.document.model.service.DocumentService;
import com.kh.develoffice.document.model.vo.Approval;
import com.kh.develoffice.document.model.vo.Document;
import com.kh.develoffice.document.model.vo.Reference;
import com.kh.develoffice.employee.model.service.EmployeeService;
import com.kh.develoffice.employee.model.vo.Employee;
import com.kh.develoffice.employee.model.vo.Widget;
import com.kh.develoffice.employee.model.vo.WorkTime;
import com.kh.develoffice.free.model.service.FreeService;
import com.kh.develoffice.free.model.vo.Free;
import com.kh.develoffice.mail.model.service.MailService;
import com.kh.develoffice.mail.model.vo.Mail;
import com.kh.develoffice.notice.model.service.NoticeService;
import com.kh.develoffice.notice.model.vo.Notice;
import com.kh.develoffice.project.model.service.ProjectService;
import com.kh.develoffice.project.model.vo.Project;
import com.kh.develoffice.teamboard.model.service.TeamBoardService;
import com.kh.develoffice.teamboard.model.vo.TeamBoard;
import com.kh.develoffice.todo.model.service.TodoService;
import com.kh.develoffice.todo.model.vo.Todo;

@SessionAttributes("loginUser")
@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService eService;
	@Autowired
	private DocumentService dService;
	@Autowired
	private MailService mService;
	@Autowired
	private TodoService tService;
	@Autowired
	private FreeService fService;
	@Autowired
	private NoticeService nService;
	@Autowired
	private TeamBoardService tbSerivce;
	@Autowired
	private ProjectService pService;
	/**
	 * - 로그인 
	 * @param emp
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="login.do", method = RequestMethod.POST)
	   public ModelAndView loginMember(Employee emp, HttpSession session, ModelAndView mv) {
		
		Employee loginUser = eService.loginEmp(emp);	// 로그인 객체 정보 호출
		int empId = loginUser.getEmpId();
		System.out.println("로그인한 유저 : "+loginUser);
		if(loginUser != null) {
			   session.setAttribute("loginUser", loginUser);	// 세션에 로그인 객체 담기
			   
			// 해당 계정의 위젯 정보 호출
			   ArrayList<Widget> widgetList = eService.selectWidget(empId);
			   
			   JSONArray jArr = new JSONArray();
				for(Widget w : widgetList) {
					JSONObject jObj = new JSONObject();
					jObj.put("widgetType", w.getWidgetType());
					jObj.put("empId", w.getEmpId());
					jObj.put("left", w.getLeft());
					jObj.put("top", w.getTop());
					jObj.put("fold", w.getFold());
					jObj.put("status", w.getStatus());
					
					jArr.add(jObj);
				}
				mv.addObject("widgetList", jArr);
				
				// 근태 정보 호출
				ArrayList<WorkTime> workList = eService.selectWorkList(empId);
				JSONArray work = new JSONArray();
				for(WorkTime w : workList) {
					JSONObject jObj = new JSONObject();
					jObj.put("today", w.getToday());
					jObj.put("empId", w.getEmpId());
					jObj.put("checkIn", w.getCheckIn());
					jObj.put("checkOut", w.getCheckOut());
					
					work.add(jObj);
				}
				mv.addObject("workList", work);
			   
				// 나와 관련된 문서 모두 호출
				ArrayList<Document> dd = dService.selectDocuList(empId);
				ArrayList<Document> docuList = new ArrayList<>();
				//System.out.println(dd.size());
				int limit=0;
				if(dd != null) {
					
					if(dd.size() < 5) {
						limit=dd.size();
					}else {
						limit=5;
					}
					
					for(int i = 0; i < limit; i++) {
						docuList.add(dd.get(i));
					}
					
					ArrayList<Approval> apList = dService.selectMyApproval(empId);		// 문서당 결재라인 호출
					ArrayList<Reference> rfList = dService.selectMyReference(empId);	//문서당 참조라인 호출
					
					for(Document d : docuList){
						
						String[] sArr = d.getDocuDate().split(" ");
						d.setDocuDate(sArr[0]);
						
						for(Approval a : apList) {
							if(d.getDocuNum() == a.getDocuNum()) {
								d.setDv("결재");				
							}
						}
						for(Reference r : rfList) {
							if(d.getDocuNum() == r.getDocuNum()) {
								d.setDv("참조");
							}
						}
						if(d.getDocuType().equals("CN")) {
							d.setDv("회람");
							d.setStatus("완료");
							continue;
						}
						if(d.getEmpId() == empId) {	// 내가 작성한 문서 이면
							d.setDv("기안");
							
							ArrayList<Approval> apArr = dService.approvalCheck(d.getDocuNum());
							for(int i=0; i<apArr.size(); i++) {
								if(apArr.get(apArr.size()-1).getStatus().equals("Y")) {
									d.setStatus("완료");
								} else {
									d.setStatus("진행중");
								}
							}
						} else {	// 내가 올린 기안이 아니면
							ArrayList<Approval> apArr = dService.approvalCheck(d.getDocuNum());
							for(int i=0; i<apArr.size(); i++) {
								
								if(apArr.get(i).getEmpId() == empId) {	// 내가 결재라인에 있을때
									if( i != 0 && apArr.get(i-1).getStatus().equals("Y") && apArr.get(i).getStatus().equals("N")) {
										d.setStatus("결재 대기");
										break;
									} else if(apArr.get(apArr.size()-1).getStatus().equals("Y")){
										d.setStatus("완료");
									} else if(i == 0 && apArr.get(i).getStatus().equals("N")) {
										d.setStatus("결재 대기");
										break;
									} else {
										d.setStatus("진행중");
									}
								} else {	// 내가 결재라인에 없을때
									if(apArr.get(apArr.size()-1).getStatus().equals("Y")) {
										d.setStatus("완료");
									} else {
										d.setStatus("진행중");
									}
								}
							}
						}
					}
					mv.addObject("docuList", docuList);
				}
				// 메일 호출
				ArrayList<Mail> tempMailList = mService.selectMyMail(loginUser);
				ArrayList<Mail> mailList = new ArrayList<>();
					
				int limit2=0;
				if(tempMailList != null) {
					
					if(tempMailList.size() < 5) {
						limit2=tempMailList.size();
					}else {
						limit2=5;
					}
					
					for(int i = 0; i < limit2; i++) {
						mailList.add(tempMailList.get(i));
					}
					mv.addObject("mailList", mailList);
				}
				
				// todo 호출
				// 진행중 리스트
				ArrayList<Todo> todoGoingList = tService.selectWidgetGoingTodoList(empId);
				// 대기 리스트
				ArrayList<Todo> todoWaitList = tService.selectWidgetWaitTodoList(empId);
				
				mv.addObject("todoGoingList", todoGoingList);
				mv.addObject("todoWaitList", todoWaitList);
				
				mv.setViewName("main/mainPage");
				
		   } else {			   
			   mv.addObject("msg", "로그인 실패");		// 전달하고자 하는 데이터 담기 addObject(key, value);
			   mv.setViewName("login");	// 뷰에 대한 정보 담기 setViewName(뷰명);
		   }
		  
		return mv;
	}
	
	/**
	 * 로고 누르면 메인페이지 이동
	 * @param empId
	 * @param mv
	 * @param session
	 * @return
	 */
	@RequestMapping("mainPage.do")
	public ModelAndView mainPage(int empId, ModelAndView mv, HttpSession session) {
		
		Employee loginUser = eService.selectEmp(empId);	// 로그인 객체 정보 호출
		System.out.println("로그인한 유저 : "+loginUser);
		   if(loginUser != null) {
			   session.setAttribute("loginUser", loginUser);	// 세션에 로그인 객체 담기
			   
			// 해당 계정의 위젯 정보 호출
			   ArrayList<Widget> widgetList = eService.selectWidget(empId);
			   
			   JSONArray jArr = new JSONArray();
				for(Widget w : widgetList) {
					JSONObject jObj = new JSONObject();
					jObj.put("widgetType", w.getWidgetType());
					jObj.put("empId", w.getEmpId());
					jObj.put("left", w.getLeft());
					jObj.put("top", w.getTop());
					jObj.put("fold", w.getFold());
					jObj.put("status", w.getStatus());
					
					jArr.add(jObj);
				}
				mv.addObject("widgetList", jArr);
				
				// 근태 정보 호출
				ArrayList<WorkTime> workList = eService.selectWorkList(empId);
				JSONArray work = new JSONArray();
				for(WorkTime w : workList) {
					JSONObject jObj = new JSONObject();
					jObj.put("today", w.getToday());
					jObj.put("empId", w.getEmpId());
					jObj.put("checkIn", w.getCheckIn());
					jObj.put("checkOut", w.getCheckOut());
					
					work.add(jObj);
				}
				mv.addObject("workList", work);
			   
				// 나와 관련된 문서 모두 호출
				ArrayList<Document> dd = dService.selectDocuList(empId);
				ArrayList<Document> docuList = new ArrayList<>();
				//System.out.println(dd.size());
				int limit=0;
				if(dd != null) {
					
					if(dd.size() < 5) {
						limit=dd.size();
					}else {
						limit=5;
					}
					
					for(int i = 0; i < limit; i++) {
						docuList.add(dd.get(i));
					}
					
					ArrayList<Approval> apList = dService.selectMyApproval(empId);		// 문서당 결재라인 호출
					ArrayList<Reference> rfList = dService.selectMyReference(empId);	//문서당 참조라인 호출
					
					for(Document d : docuList){
						
						String[] sArr = d.getDocuDate().split(" ");
						d.setDocuDate(sArr[0]);
						
						for(Approval a : apList) {
							if(d.getDocuNum() == a.getDocuNum()) {
								d.setDv("결재");				
							}
						}
						for(Reference r : rfList) {
							if(d.getDocuNum() == r.getDocuNum()) {
								d.setDv("참조");
							}
						}
						if(d.getDocuType().equals("CN")) {
							d.setDv("회람");
							d.setStatus("완료");
							continue;
						}
						if(d.getEmpId() == empId) {	// 내가 작성한 문서 이면
							d.setDv("기안");
							
							ArrayList<Approval> apArr = dService.approvalCheck(d.getDocuNum());
							for(int i=0; i<apArr.size(); i++) {
								if(apArr.get(apArr.size()-1).getStatus().equals("Y")) {
									d.setStatus("완료");
								} else {
									d.setStatus("진행중");
								}
							}
						} else {	// 내가 올린 기안이 아니면
							ArrayList<Approval> apArr = dService.approvalCheck(d.getDocuNum());
							for(int i=0; i<apArr.size(); i++) {
								
								if(apArr.get(i).getEmpId() == empId) {	// 내가 결재라인에 있을때
									if( i != 0 && apArr.get(i-1).getStatus().equals("Y") && apArr.get(i).getStatus().equals("N")) {
										d.setStatus("결재 대기");
										break;
									} else if(apArr.get(apArr.size()-1).getStatus().equals("Y")){
										d.setStatus("완료");
									} else if(i == 0 && apArr.get(i).getStatus().equals("N")) {
										d.setStatus("결재 대기");
										break;
									} else {
										d.setStatus("진행중");
									}
								} else {	// 내가 결재라인에 없을때
									if(apArr.get(apArr.size()-1).getStatus().equals("Y")) {
										d.setStatus("완료");
									} else {
										d.setStatus("진행중");
									}
								}
							}
						}
					}
					mv.addObject("docuList", docuList);
				}
				// 메일 호출
				ArrayList<Mail> tempMailList = mService.selectMyMail(loginUser);
				ArrayList<Mail> mailList = new ArrayList<>();
					
				int limit2=0;
				if(tempMailList != null) {
					
					if(tempMailList.size() < 5) {
						limit2=tempMailList.size();
					}else {
						limit2=5;
					}
					
					for(int i = 0; i < limit2; i++) {
						mailList.add(tempMailList.get(i));
					}
					mv.addObject("mailList", mailList);
				}
				
				// todo 호출
				// 진행중 리스트
				ArrayList<Todo> todoGoingList = tService.selectWidgetGoingTodoList(empId);
				// 대기 리스트
				ArrayList<Todo> todoWaitList = tService.selectWidgetWaitTodoList(empId);
				
				mv.addObject("todoGoingList", todoGoingList);
				mv.addObject("todoWaitList", todoWaitList);
				
					
				mv.setViewName("main/mainPage");
				
		   } else {			   
			   mv.addObject("msg", "로그인 실패");		// 전달하고자 하는 데이터 담기 addObject(key, value);
			   mv.setViewName("login");	// 뷰에 대한 정보 담기 setViewName(뷰명);
		   }
		  
		return mv;
	}
	
	/**
	 * - 로그아웃
	 * @param status
	 * @param mv
	 * @return
	 */
	@RequestMapping("logout.do")
	public ModelAndView logout(SessionStatus status, ModelAndView mv) {
		// SessionStatus : 세션의 상태를 관리하는 객체
		
		status.setComplete();
		
		mv.setViewName("login");
		
		return mv;
	}
	
	
	/**
	 * 위젯 정보 저장
	 * @param w
	 * @return
	 */
	@ResponseBody
	@RequestMapping("saveWidget.do")
	public String saveWidget(Widget w) {
		
		int result = eService.saveWidget(w);
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	
	
	/**
	 * 직원 검색 자동완성
	 * @param key
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping("autocomplete.do")
	public JSONArray autocomplete(String key, Model model) {
		
		SimpleDateFormat sdf = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		ArrayList<Employee> list = eService.autocomplete(key);
		//System.out.println(list);
		
		JSONArray jArr = new JSONArray();
		
		if(list != null) {
			
			for(Employee e : list) {
				JSONObject jObj = new JSONObject();
				jObj.put("empId", e.getEmpId());
				jObj.put("empName", e.getEmpName());
				jObj.put("empPwd", e.getEmpPwd());
				jObj.put("gender", e.getGender());
				jObj.put("birth", sdf.format(e.getBirth()));
				jObj.put("deptCode", e.getDeptCode());
				jObj.put("deptName", e.getDeptName());
				jObj.put("jobCode", e.getJobCode());
				jObj.put("jobName", e.getJobName());
				jObj.put("phone", e.getPhone());
				jObj.put("email", e.getEmail());
				jObj.put("address", e.getAddress());
				jObj.put("salary", e.getSalary());
				jObj.put("account", e.getAccount());
				jObj.put("star", e.getStar());
				jObj.put("empStatus", e.getEmpStatus());
				jObj.put("profilePath", e.getProfilePath());
				
				jArr.add(jObj);
			}
			return jArr;
			
		}else {
			return jArr;
		}
	}
	
	
	
	/**
	 * 출근 정보 저장
	 * @param work
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping("startWork.do")
	public String insertStartTime(WorkTime work,HttpSession session) {
		
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyyMMdd", Locale.KOREA);
		Date temp = new Date();
		work.setToday(sdf.format(temp));
		//System.out.println(work);
		
		int result = eService.insertStartTime(work);
		
		if(result > 0) {
			int result2 = eService.updateWorkStatus(work);
			
			if(result2 > 0) {
				Employee loginUser = eService.selectEmp(work.getEmpId());
				session.setAttribute("loginUser", loginUser);
				return "success";
			}else {
				return "fail";
			}
		}else {
			return "fail";
		}
	}
	
	/**
	 * 퇴근 정보 저장
	 * @param work
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping("endWork.do")
	public JSONArray updateEndTime(WorkTime work,HttpSession session) {
		
		SimpleDateFormat sdf = new SimpleDateFormat ("yyyyMMdd", Locale.KOREA);
		SimpleDateFormat sdf2 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss", Locale.KOREA );
		Date temp = new Date();
		work.setToday(sdf.format(temp));
		//System.out.println(work);
		
		int result = eService.updateEndTime(work);
		JSONArray workList = new JSONArray();
		
		if(result > 0) {
			int result2 = eService.updateWorkStatus2(work);
			
			if(result2 > 0) {
				Employee loginUser = eService.selectEmp(work.getEmpId());
				session.setAttribute("loginUser", loginUser);
				
				ArrayList<WorkTime> wList = eService.selectWorkList(work.getEmpId());
				for(WorkTime w : wList) {
					JSONObject jObj = new JSONObject();
					jObj.put("today", w.getToday());
					jObj.put("empId", w.getEmpId());
					jObj.put("checkIn", w.getCheckIn());
					jObj.put("checkOut", w.getCheckOut());
					
					workList.add(jObj);
				}
				//System.out.println(workList);
				return workList;
			} else {
				return workList;
			}
		}else {
			return workList;
		}
	}
	
	
	
	/**
	 * 마이페이지 이동
	 * @return
	 */
	@RequestMapping("myProfile.do")
	public ModelAndView myProfilePage(int empId, ModelAndView mv) {
		
		ArrayList<Widget> widgetList = eService.selectWidget(empId);
		
		// project 호출
		ArrayList<Project> projectList = pService.selectPlist(empId);
		mv.addObject("projectList", projectList);
		
		// 내가 포함된 project 갯수 호출
		int countProject = pService.countProject(empId);
		mv.addObject("countProject", countProject);
		
		// 전체 사원 호출
		ArrayList<Employee> empList = eService.selectAllEmp();
		mv.addObject("empList", empList);
		
		JSONArray jArr = new JSONArray();
		for(Widget w : widgetList) {
			JSONObject jObj = new JSONObject();
			jObj.put("widgetType", w.getWidgetType());
			jObj.put("empId", w.getEmpId());
			jObj.put("left", w.getLeft());
			jObj.put("top", w.getTop());
			jObj.put("fold", w.getFold());
			jObj.put("status", w.getStatus());
			
			jArr.add(jObj);
		}
		mv.addObject("widgetList", jArr);
		mv.setViewName("common/myPage");
		
		return mv;
	}
	
	/**
	 * 마이페이지 정보 수정
	 * @param e
	 * @param status
	 * @param request
	 * @param session
	 * @param uploadFile
	 * @return
	 */
	@ResponseBody
	@RequestMapping("myPageUpdate.do")
	public String updateMyPage(Employee e, SessionStatus status, HttpServletRequest request, HttpSession session, @RequestParam(name="profile", required=false) MultipartFile uploadFile) {
		int empId = ((Employee)session.getAttribute("loginUser")).getEmpId();
		String filename = "";
		e.setEmpId(empId);
		if(uploadFile!=null && !uploadFile.getOriginalFilename().equals("")) {	// 첨부파일이 넘어온 경우
			filename = saveFile(uploadFile, request);
			e.setProfilePath(filename);
		}
		System.out.println(e);
		int result = eService.updateMypage(e);
		
		if(result > 0) {
			Employee loginUser = eService.selectEmp(empId);
			System.out.println(loginUser);
			((Employee)session.getAttribute("loginUser")).setProfilePath(loginUser.getProfilePath());
			((Employee)session.getAttribute("loginUser")).setPhone(e.getPhone());
			((Employee)session.getAttribute("loginUser")).setStatusMsg(e.getStatusMsg());
			((Employee)session.getAttribute("loginUser")).setAddress(e.getAddress());
			return loginUser.getProfilePath();
		}else {
			return "fail";
		}
	}
	
	/**
	 * 파일저장
	 * @param file
	 * @param request
	 * @return
	 */
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		// 파일이 저장될 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\upload\\profile";
		
		File folder = new File(savePath);	// 저장될 폴더
		
		if(!folder.exists()) {	// 폴더가 없다면
			folder.mkdirs();	// 폴더를 생성해라
		}
		
		String originalFileName = file.getOriginalFilename();	// 원본명(확장자)
		
		// 파일명 수정작업 --> 년월일시분초.확장자
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) // 년월일시분초
							  + originalFileName.substring(originalFileName.lastIndexOf("."));
		
		// 실제 저장될 경로 savePath + 저장하고자하는 파일명 renameFileName
		String renamePath = savePath + "\\" + renameFileName;	
		
		try {
			file.transferTo(new File(renamePath));
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return renameFileName;	// 수정명 반환
	}	
	
	/**
	 * 비밀번호 수정 화면으로 이동
	 * @return
	 */
	@RequestMapping("updatePwdForm.do")
	public String updatePwdForm() {
		return "common/updatePwdForm";
	}
	
	@ResponseBody
	@RequestMapping("pwdConfirm.do")
	public String pwdConfirm(Employee emp, HttpSession session) {
		int empId = ((Employee)session.getAttribute("loginUser")).getEmpId();
		emp.setEmpId(empId);
		Employee loginUser = eService.loginEmp(emp);	// 로그인 객체 정보 호출
		
		if(loginUser != null) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("updatePwd.do")
	public String updatePwd(Employee e, HttpSession session) {
		int empId = ((Employee)session.getAttribute("loginUser")).getEmpId();
		e.setEmpId(empId);
		int result = eService.updatePwd(e);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	/**
	 * 조직도
	 * @return
	 */
	@RequestMapping("orgChart.do")
	public String orgChart() {
		
		return "common/orgChart";
	}
	
	@ResponseBody
	@RequestMapping("refreshBoardWidget.do")
	public void refreshBoardWidget(Employee emp, String condition, HttpServletResponse response) throws JsonIOException, IOException {
		
		response.setContentType("application/json; charset=utf-8");
		Gson gson = new Gson();
		
		if(condition.equals("N")) {	// 공지사항
			ArrayList<Notice> boardList = nService.selectList();
			gson.toJson(boardList, response.getWriter());
			
		}else if(condition.equals("T")) {	// 팀 게시판
			ArrayList<TeamBoard> boardList = tbSerivce.selectList(emp.getDeptCode());
			gson.toJson(boardList, response.getWriter());
			
		}else {	// 자유게시판
			ArrayList<Free> boardList = fService.selectList();
			gson.toJson(boardList, response.getWriter());			
		}
	}
	
	
	@ResponseBody
	@RequestMapping("updateWidget.do")
	public String updateWidget(Widget w) {
		
		int result = eService.updateWidget(w);
		
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
		
		
	}
	
	

}
