package dr.board.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;

import dr.board.dao.BoardDAO;
import dr.board.vo.BoardReplyVO;
import dr.controller.Action;

public class DeleteReplyAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//전송된 데이터 인코딩 처리
		request.setCharacterEncoding("utf-8");
		
		//전송된 데이터 반환
		int reply_num = Integer.parseInt(request.getParameter("reply_num"));
		
		Map<String,String> mapAjax = new HashMap<String,String>();
		
		BoardDAO dao = BoardDAO.getInstance();
		BoardReplyVO db_reply = dao.getReplyBoard(reply_num);
		
		HttpSession session = request.getSession();
		Integer user_num = (Integer)session.getAttribute("user_num");
		if(user_num==null) { //로그인이 되지 않은 경우
			mapAjax.put("result", "logout");
		}else if(user_num!=null && user_num == db_reply.getMem_num()) {
			//로그인 회원번호와 작성자 회원번호 일치
			dao.deleteReplyBoard(reply_num);
			
			mapAjax.put("result", "success");
			
		}else {  //로그인 회원번호와 작성자 회원번호 불일치
			mapAjax.put("result", "wrongAccess");
		}
		
		//JSON 데이터로 변환
		ObjectMapper mapper = new ObjectMapper();
		String ajaxData = mapper.writeValueAsString(mapAjax);
		
		request.setAttribute("ajaxData", ajaxData);
		
		return "/WEB-INF/views/common/ajax_view.jsp";
	}

}
