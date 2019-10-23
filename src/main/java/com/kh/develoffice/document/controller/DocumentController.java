package com.kh.develoffice.document.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.develoffice.common.Department;
import com.kh.develoffice.document.model.service.DocumentService;
import com.kh.develoffice.document.model.vo.DocuA;
import com.kh.develoffice.document.model.vo.DocuB;
import com.kh.develoffice.document.model.vo.Document;
import com.kh.develoffice.document.model.vo.DocumentFile;
import com.kh.develoffice.employee.model.service.EmployeeService;
import com.kh.develoffice.employee.model.vo.Employee;

@Controller
public class DocumentController {
	
	@Autowired
	private DocumentService dService;
	@Autowired
	private EmployeeService eService;
	
	@RequestMapping("insertDocumentForm.do")
	public ModelAndView insertDocumentForm(ModelAndView mv) {
		
		ArrayList<Department> deptList = dService.selectDept();
		ArrayList<Employee> empList = eService.selectAllEmp();
		
		//System.out.println(deptList);
		//System.out.println(empList);
		
		JSONArray deptArr = new JSONArray();
		JSONArray empArr = new JSONArray();

		for(Department d : deptList) {
			JSONObject jObj = new JSONObject();
			jObj.put("deptCode", d.getDeptCode());
			jObj.put("deptName", d.getDeptName());
			jObj.put("count", d.getCount());
			
			deptArr.add(jObj);
		}
		
		for(Employee e : empList) {
			JSONObject jObj = new JSONObject();
			jObj.put("empId", e.getEmpId());
			jObj.put("empName", e.getEmpName());
			jObj.put("deptCode", e.getDeptCode());
			jObj.put("deptName", e.getDeptName());
			jObj.put("jobCode", e.getJobCode());
			jObj.put("jobName", e.getJobName());
			jObj.put("account", e.getAccount());
			
			empArr.add(jObj);
		}
		mv.addObject("empList", empArr);
		mv.addObject("deptList", deptArr);
		mv.addObject("deptSize", deptArr.size());
		mv.setViewName("document/document");
		
		return mv;
	}
	
	@RequestMapping("documentTable.do")
	public String documentTableList() {
		return "document/dcTable";
	}
		
	@RequestMapping("documentDetailView.do")
	public String documentDetailView() {
		return "document/dcDetailA";
		/* return "common/test"; */
	}
	
	@ResponseBody
	@RequestMapping("insertDocument.do")
	public String insertDocument(Document document, DocuA docuA, DocuB docuB, 
			HttpServletRequest request, HttpSession session,
			@RequestParam(name="uploadFile", required=false) MultipartFile uploadFile) {
		
		System.out.println(document);
		System.out.println(docuA);
		System.out.println(docuB);
		System.out.println(uploadFile);
		String tempStr1 = request.getParameter("apArr");
		String tempStr2 = request.getParameter("rfArr");
		System.out.println("apArr : "+tempStr1);
		System.out.println("rfArr : "+tempStr2);
		
		Document docu = document;
		String filename = "";

		if(uploadFile!=null && !uploadFile.getOriginalFilename().equals("")) {	// 첨부파일이 넘어온 경우
		
			filename = saveFile(uploadFile, request);
			
			if(filename != null) {	// 파일이 잘 저장된 경우
				docu.setFileStatus("Y");
			} else {
				docu.setFileStatus("N");
			}
		} else {
			docu.setFileStatus("N");
		}
		
		System.out.println(docu);
		
		String type = document.getDocuType();
		int result = dService.insertDocument(docu);	//통합문서 insert
		int result2 = 0;
		
		if(result > 0) {	// 통합문서 insert 성공
			
			if(type.equals("AP")) {
				result2 = dService.insertDocuA(docuA);	//지출결의서 insert
			}else {
				result2 = dService.insertDocuB(docuB);	//회람,품의서 insert
			}
			
			if(result2 > 0) { // 문서 타입별로 insert 성공
				
				if(tempStr1 != null) {	// 결제라인이 null 이 아니면
					String[] Arr = tempStr1.split(",");
					for(int i = 0; i < Arr.length; i++) {
						int apResult = dService.insertApproval(Integer.parseInt(Arr[i]));
						
						if(apResult <= 0) {
							System.out.println("결재라인 insert 실패");
							return "fail";
						}
					}
				}
				if(tempStr2 != null) {	// 참조라인이 null 이 아니면
					String[] Arr = tempStr2.split(",");
					for(int i = 0; i < Arr.length; i++) {
						int rfResult = dService.insertReference(Integer.parseInt(Arr[i]));
						
						if(rfResult <= 0) {
							System.out.println("참조라인 insert 실패");
							return "fail";
						}
					}
				}
				
				if(docu.getFileStatus().equals("Y")) {	// 첨부파일이 있으면
					
					String root = request.getSession().getServletContext().getRealPath("resources");
					String savePath = root + "\\upload\\documentFile";
					
					DocumentFile dFile = new DocumentFile();
					dFile.setFilePath(savePath);
					dFile.setOriginName(uploadFile.getOriginalFilename());
					dFile.setChangeName(filename);
					
					int fileResult = dService.insertFile(dFile);
					
					if(fileResult <= 0) {
						System.out.println("첨부 파일 insert 실패");
						return "fail";
					}
				}
				return "success";
				
			} else {	// 문서타입별 insert 실패
				System.out.println("문서 타입별 insert 실패");
				return "fail";
			}
			
		} else {	// 통합문서 insert 실패
			System.out.println("통합 문서 테이블 insert 실패");
			return "fail";
		}
		
	}
	
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		// 파일이 저장될 경로 설정
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\upload\\documentFile";
		
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
	
	
	
	
}
