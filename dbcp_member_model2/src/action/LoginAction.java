package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.mysql.fabric.xmlrpc.base.Member;

import dao.MemberDAO;
import vo.MemberVO;

public class LoginAction implements Action {

	private String path;

	public LoginAction(String path) {
		super();
		this.path = path;
	}

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// index.jsp 에서 id랑pwd랑 가져오기
		String id = (String) req.getParameter("id");
		String pwd = (String) req.getParameter("current_pass");

		// 가져온 정보가 db에 있는지 확인
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.isLogin(id, pwd);

		// 있는 사용자라면 세션에 값을 담고 이동
		if (vo != null) {
			HttpSession session=req.getSession();
			session.setAttribute("vo", vo);

			// 없는 사용자라면 로그인 정보를 확인하세요. 창 띄워주고 로그인 폼 보여주기
		} else {
			
			path+="?msg=fail";
		}

		// 세션에 담기때문에 ture하는것.
		return new ActionForward(path, true);
	}

}


