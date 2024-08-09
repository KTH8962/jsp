package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.User;



@WebServlet("/qwer")
public class TestController extends HttpServlet {
	//HttpServlet doGet이라는 메소드를 오버라이딩
	//get은 doGet, post는 doPost
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("test 클래스 호출!");
        // 요청 파라미터에서 이름을 가져오기
        String userName = request.getParameter("userName");
        // 모델 생성
        User user = new User(userName);
        // 모델 데이터를 request 객체에 저장
        request.setAttribute("user", user);
        // 뷰(JSP)로 포워딩
        request.getRequestDispatcher("/day5/test.jsp").forward(request, response);
    }
}