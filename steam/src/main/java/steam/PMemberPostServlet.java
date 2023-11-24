package steam;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch18.PMemberMgr;

/*서블릿 매핑 이름을 선언함*/
@WebServlet("/steam/pmemberPost")	//  <-- 시험에 나옴 빈칸 채우기
public class PMemberPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/* pregister.jsp의 method가 post이기 때문에 서블릿에서 doPost 메서드를 선언 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		PMemberMgr pMgr = new PMemberMgr();
		
		if(pMgr.insertPMember(request)) {
			
			/* request 객체에서 session객체를 리턴 받고, session에 msg라는 name값으로 회원가입 성공 메시지 저장함 */
			request.getSession().setAttribute("msg", "회원 가입에 성공했습니다");
			response.sendRedirect("login.jsp");
			
		}else {
			request.getSession().setAttribute("msg", "회원 가입에 실패 하였습니다");
			response.sendRedirect("pregister.jsp");
			
		}
	}
}