/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.43
 * Generated at: 2019-10-07 03:02:54 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.mail;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class sendMail_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("/WEB-INF/lib/taglibs-standard-impl-1.2.5.jar", Long.valueOf(1569423083612L));
    _jspx_dependants.put("jar:file:/C:/git_개인/develoffice/finalProject/src/main/webapp/WEB-INF/lib/taglibs-standard-impl-1.2.5.jar!/META-INF/c.tld", Long.valueOf(1425946270000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<style>\r\n");
      out.write("\t.contentWrap{\r\n");
      out.write("\t\tfloat:left;\r\n");
      out.write("\t\twidth:75%;\r\n");
      out.write("\t\tbackground: white;\r\n");
      out.write("\t\tpadding-top:30px;\r\n");
      out.write("\t\tpadding-bottom:30px;\r\n");
      out.write("\t\tpadding-left:50px;\r\n");
      out.write("\t\tpadding-right:50px;\r\n");
      out.write("\t\tfont-size:14px;\r\n");
      out.write("\t}\r\n");
      out.write("\t.mName hover{\r\n");
      out.write("\t\tcursor:pointer;\r\n");
      out.write("\t}\r\n");
      out.write("\t.aa{\r\n");
      out.write("\t\ttext-align:right;\r\n");
      out.write("\t}\r\n");
      out.write("\t.placeholderBackground{ \r\n");
      out.write("\t\tbackground-color: #a5a5a5; \r\n");
      out.write("\t\theight: 0.5em; \r\n");
      out.write("\t\tline-height: 0.5em; \r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<!-- WRAPPER -->\r\n");
      out.write("\t<div id=\"wrapper\">\r\n");
      out.write("\t<!--  -->\r\n");
      out.write("\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "../common/navibar.jsp", out, false);
      out.write("\r\n");
      out.write("\t<!--  -->\r\n");
      out.write("\t\r\n");
      out.write("\t<!-- MAIN -->\r\n");
      out.write("\t\t<div class=\"main\">\r\n");
      out.write("\t\t\t<!-- MAIN CONTENT -->\r\n");
      out.write("\t\t\t<div class=\"main-content\">\r\n");
      out.write("\t\t\t\t<div class=\"container-fluid\">\r\n");
      out.write("\t\t\t\t\t<div class=\"contentWrap\" style=\"width:1230px;\">\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t<!-- 이 아래부터 내용 작성 -->\r\n");
      out.write("\r\n");
      out.write("\t\t<div class=\"panel contents content_title\" style=\"width:1130px;\">\r\n");
      out.write("\t\t\t<div class=\"panel-heading\" id='m_list_default_menu'>\r\n");
      out.write("\t\t\t\t\t<span class=\"panel-title detail_select\" style=\"font-size:16px; color:#2985db\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"checkbox\" id=\"chkAll\" onclick=\"MailList.CheckAll();\">\r\n");
      out.write("\t\t\t\t\t\t <a href=\"javascript:void(0)\" id='m_list_view_option' >보기: \r\n");
      out.write("\t\t\t\t\t\t \t<span id='special_search_label'>모두</span>\r\n");
      out.write("\t\t\t\t\t\t \t<img src=\"https://office.hiworks.com/static/ui/images/btn_drop.gif\">\r\n");
      out.write("\t\t\t\t\t \t</a>\r\n");
      out.write("\t\t\t\t\t \t<span id='m_list_checked_action' style='display:none'><label id='m_list_checked_cnt' ></label></span> \r\n");
      out.write("\t\t\t\t\t\t<div id='m_list_view_option_detail' class=\"dropdown hide\" >\r\n");
      out.write("\t\t                    <ul class=\"dropdown-menu\">\r\n");
      out.write("\t\t                        <li><a href=\"javascript:void(0)\" onclick=\"MailList.SpecialSearch('');\">모두</a></li>\r\n");
      out.write("\t\t                        <li><a href=\"javascript:void(0)\" onclick=\"MailList.SpecialSearch('star');\" >별 표시</a></li>\r\n");
      out.write("\t\t                        <li><a href=\"javascript:void(0)\" onclick=\"MailList.SpecialSearch('attach');\" >첨부 있음</a></li>\r\n");
      out.write("\t\t                        <li><a href=\"javascript:void(0)\"onclick=\"MailList.SpecialSearch('unread');\" >안 읽은 메일</a></li>\r\n");
      out.write("\t\t                        <li><a href=\"javascript:void(0)\" onclick=\"MailList.SpecialSearch('read');\">읽은 메일</a></li>\r\n");
      out.write("\t\t                    </ul>\r\n");
      out.write("\t\t                </div>\r\n");
      out.write("\t\t\t\t\t</span>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t        <div id='m_list_checked_menu' style='display:none'>\r\n");
      out.write("\t            <span class=\"detail_select\" id=\"m_list_checked_menu_delete\">\r\n");
      out.write("\t                <a href=\"javascript:void(0)\" onclick=\"MailList.moveToTrash();\">삭제</a>\r\n");
      out.write("\t            </span>\r\n");
      out.write("\t            <span class=\"detail_select\">\r\n");
      out.write("\t                <a href=\"javascript:void(0)\" onclick=\"MailList.DeleteSelected();\">완전삭제</a>\r\n");
      out.write("\t            </span>\r\n");
      out.write("\t<!--             <span class=\"detail_select\" id=\"m_list_checked_menu_resend\"> -->\r\n");
      out.write("\t<!--                 <a href=\"javascript:void(0)\" onclick=\"MailList.ResendSelected(event);\">재발송</a> -->\r\n");
      out.write("\t<!--             </span> -->\r\n");
      out.write("\t        \r\n");
      out.write("\t            <span class=\"detail_select\">\r\n");
      out.write("\t                <a href=\"javascript:void(0)\" id='m_list_move_mbox' >이동\r\n");
      out.write("\t                \t<img src=\"/static/ui/images/btn_drop.gif\" alt=\"이동 드롭다운 메뉴 열기\" class=\"open_drop\">\r\n");
      out.write("\t                </a>\r\n");
      out.write("\t                \r\n");
      out.write("\t                <div class=\"dropdown hide\" id='m_list_move_mbox_detail'>\r\n");
      out.write("\t                    <div class=\"dropscroll-menu\">\r\n");
      out.write("\t                        <ul style=\"min-width:220px; border-color:#2985db\">\r\n");
      out.write("\t                            <li>\r\n");
      out.write("\t                                <a href=\"javascript:void(0)\" id=\"move_b0\"onclick=\"MailList.moveTo('b0')\">받은 편지함</a>\r\n");
      out.write("\t                            </li>\r\n");
      out.write("\t                            <li>\r\n");
      out.write("\t                                <a href=\"javascript:void(0)\" id=\"move_b1\"onclick=\"MailList.moveTo('b1')\"> 보낸 편지함</a>\r\n");
      out.write("\t                            </li>    \r\n");
      out.write("\t                            <li>\r\n");
      out.write("\t                                <a href=\"javascript:void(0)\" id=\"move_b3\"onclick=\"MailList.moveTo('b3')\">임시 보관함 </a>\r\n");
      out.write("\t                            </li>\r\n");
      out.write("\t                            <li>\r\n");
      out.write("\t                                <a href=\"javascript:void(0)\" id=\"move_b5\"onclick=\"MailList.moveTo('b5')\"> 휴지통</a>\r\n");
      out.write("\t                            </li>\r\n");
      out.write("\t                        </ul>\r\n");
      out.write("\t                   </div>\r\n");
      out.write("\t                </div>\r\n");
      out.write("\t            </span>\r\n");
      out.write("\t        </div>        \r\n");
      out.write("\r\n");
      out.write("\t\t\t<div class=\"panel-body\">\r\n");
      out.write("\t\t\t\t<table class=\"table\" id=\"listArea\">\r\n");
      out.write("\t\t\t\t\t<thead>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<th style=\"width:0.1px\"></th> <!-- 메일번호 -->\r\n");
      out.write("\t\t\t\t\t\t\t<th>체크/별</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th>보낸 사람</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th style=\"width:550px;\">메일 제목</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th style=\"width:130px;\" class=\"aa\">파일 첨부 여부</th>\r\n");
      out.write("\t\t\t\t\t\t\t<th style=\"width:130px;\" class=\"aa\">받은 날짜</th>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</thead>\r\n");
      out.write("\t\t\t\t\t<tbody>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td><input type=\"hidden\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td><input type=\"checkbox\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"mName\">전재광</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"mTitle\">메일제목입니다.</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td align=\"right\">첨부파일</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"aa\">19-09-16 09:47</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td><input type=\"hidden\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td><input type=\"checkbox\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"mName\">유현규</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"mTitle\">메일제목입니다.</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td align=\"right\">첨부파일</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"aa\">19-09-17 10:43</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td><input type=\"hidden\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td><input type=\"checkbox\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"mName\">설용환</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"mTitle\">메일제목입니다.</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td align=\"right\">첨부파일</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"aa\">19-09-18 11:53</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td><input type=\"hidden\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td><input type=\"checkbox\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"mName\">김성은</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"mTitle\">메일제목입니다.</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td align=\"right\">첨부파일</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"aa\">19-09-19 14:00</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td><input type=\"hidden\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td><input type=\"checkbox\"></td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"mName\">원영주</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"mTitle\">메일제목입니다.</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td align=\"right\">첨부파일</td>\r\n");
      out.write("\t\t\t\t\t\t\t<td class=\"aa\">19-09-19 15:43</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</tbody>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t<!-- 이 위까지 내용작성 -->\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<!-- END MAIN CONTENT -->\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!-- END MAIN -->\r\n");
      out.write("\t\t\r\n");
      out.write("\t<div class=\"clearfix\"></div>\r\n");
      out.write("\t\t\r\n");
      out.write("\r\n");
      out.write("\t<!--  -->\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!-- END WRAPPER -->\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t<!-- Javascript -->\r\n");
      out.write("\t<script src=\"resources/assets/vendor/jquery/jquery.min.js\"></script>\r\n");
      out.write("\t<script src=\"resources/assets/vendor/bootstrap/js/bootstrap.min.js\"></script>\r\n");
      out.write("\t<script src=\"resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js\"></script>\r\n");
      out.write("\t<script src=\"resources/assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js\"></script>\r\n");
      out.write("\t<script src=\"resources/assets/vendor/chartist/js/chartist.min.js\"></script>\r\n");
      out.write("\t<script src=\"resources/assets/scripts/klorofil-common.js\"></script>\r\n");
      out.write("\t\r\n");
      out.write("\t<!-- script 작성 -->\r\n");
      out.write("\t<script>\r\n");
      out.write("\t\r\n");
      out.write("\t\t$(function(){\r\n");
      out.write("\t\t    $(\"#listArea\").find(\"td\").mouseenter(function(){\r\n");
      out.write("\t\t       $(this).parent().css({\"background\":\"#ddd\",\"cursor\":\"pointer\"});\r\n");
      out.write("\t\t    }).mouseout(function(){\r\n");
      out.write("\t\t       $(this).parent().css(\"background\",\"white\");\r\n");
      out.write("\t\t    });\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t });\r\n");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t</script>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
