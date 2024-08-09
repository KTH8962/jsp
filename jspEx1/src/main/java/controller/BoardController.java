package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import model.Board;

@WebServlet("/boardList")
public class BoardController extends HttpServlet {
    private BoardDAO boardDAO;

    public void init() {
    	boardDAO = new BoardDAO();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // 모든 사용자 정보를 가져옴
            List<Board> boardList = boardDAO.listAllBoards();
            // request 객체에 사용자 목록 저장
            request.setAttribute("boardList", boardList);

            // JSP 페이지로 포워딩
            RequestDispatcher dispatcher = request.getRequestDispatcher("day5/board-list.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
}