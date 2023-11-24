package steam;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*서블릿 매핑 이름을 선언*/
@WebServlet("/steam/pmemberUpdate")

public class PMemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/* pupdate.jsp의 method가 post이기 때문에 서블릿에서 doPost 메서드를 선언 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		PMemberMgr pMgr = new PMemberMgr();
		
		/* PMemberMgr.java의 updatePMember() 메서드 호출 */
		pMgr.updatePMember(request);
		
		HttpSession session = request.getSession();
		
		/* session에 저장된 idKey 값을 매개변수로 PMemberMgr.java의 getPMember(호출). 빈즈 타입으로 리턴함 */
		PMemberBean bean = pMgr.getPMember((String) session.getAttribute("idKey"));
		
		/* 수정된 회원 정보를 다시 bean 이름으로 저장 */
		session.setAttribute("bean", bean);
		
		response.sendRedirect("login.jsp");
	}
}