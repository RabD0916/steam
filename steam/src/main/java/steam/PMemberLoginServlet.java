package steam;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*서블릿 매핑 이름을 선언*/
@WebServlet("/steam/pmemberLogin")
public class PMemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/* login.jsp의 method가 post이기 때문에 서블릿에서 doPost 메서드를 선언 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		PMemberMgr pMgr = new PMemberMgr();
		
		/* login.jsp에서 요청한 id와 pwd 값을 받음 */
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		/* 이동하게 되는 페이지 지정 */
		String url = "login.jsp";
		
		/* PMemberMgr의 loginPMember 메서드 호출 */
		if(pMgr.loginPMember(id, pwd)) {
			/* request 객체에서 session객체를 리턴 받고, session에 idKey 라는 name을 저장 */
			request.getSession().setAttribute("idKey", id);
			
			/* id를 매개변수로 PMemberMgr.java의 getPMember(호출). 빈즈 타입으로 리턴함 */
			PMemberBean bean = pMgr.getPMember(id);
			
			/* 세션에 bean이라는 이름으로 bean객체를 저장함 */
			request.getSession().setAttribute("bean", bean);
			
		}else {
			request.getSession().setAttribute("msg", "아이디와 비밀번호가 일치하지 않습니다");
		}
		response.sendRedirect(url);
	}
}