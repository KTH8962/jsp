package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Board;

public class BoardDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/sample";
    private String jdbcUsername = "root";
    private String jdbcPassword = "test1234";
    private Connection jdbcConnection;

    // 데이터베이스 연결
    protected void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }
            jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        }
    }

    // 데이터베이스 연결 해제
    protected void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }

    // tbl_user 테이블의 모든 사용자 가져오기
    public List<Board> listAllBoards() throws SQLException {
        List<Board> boardList = new ArrayList<>();

        String sql = 
        		"SELECT B.*, U.*, CMT FROM "
        		+ "tbl_board B "
        		+ "INNER JOIN tbl_user U ON B.userId = U.userId "
        		+ "LEFT JOIN (SELECT boardNo, COUNT(*) AS CMT FROM "
        		+ "tbl_comment GROUP BY boardNo) CNT ON B.boardNo = CNT.boardNo";

        connect();

        Statement statement = jdbcConnection.createStatement();
        ResultSet rs = statement.executeQuery(sql);

        while (rs.next()) {
        	String boardNo = rs.getString("boardNo");
        	String title = rs.getString("title");
        	String name = rs.getString("name");
        	String cnt = rs.getString("cnt");
        	String cdatetime = rs.getString("cdatetime");
        	String cmtCnt = rs.getString("CMT");

        	Board board = new Board(boardNo, title, name, cnt, cdatetime, cmtCnt);
        	boardList.add(board);
        }

        rs.close();
        statement.close();
        disconnect();

        return boardList;
    }
}