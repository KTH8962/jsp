package model;

public class Board {
	private String boardNo;
	private String title;
	private String name;
	private String cnt;
	private String cdatetime;
	private String cmtCnt;
	
	public Board() {
	}
	
	public Board(String boardNo, String title, String name, String cnt, String cdatetime, String cmtCnt) {
		this.boardNo = boardNo;
		this.title = title;
		this.name = name;
		this.cnt = cnt;
		this.cdatetime = cdatetime;
		this.cmtCnt = cmtCnt;
	}

	public String getBoardNo() {
		return boardNo;
	}

	public String getTitle() {
		return title;
	}

	public String getName() {
		return name;
	}

	public String getCnt() {
		return cnt;
	}

	public String getCdatetime() {
		return cdatetime;
	}

	public String getCmtCnt() {
		return cmtCnt;
	}

}
