<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		div + div {
			margin-top : 5px;
		}
		div label > * {
			vertical-align: top;
		}
	</style>
</head>
<body>
	<form action="insert-result.jsp" onsubmit="return false" name="insert">
		<div>
			<label>제목 : <input type="text" name="title"></label>
		</div>
		<div>
			<label>내용 : <textarea cols="50" rows="10" name="contents"></textarea></label>
		</div>
		<div>
			<button type=button onclick="fnCheck()">저장</button>
		</div>
	</form>	
</body>
</html>
<script>
	function fnCheck() {
		var form = document.insert;
		if(form.title.value == "" || form.title.value == undefined) {
			alert("제목을 입력해주세요.");
			form.title.focus();
			return;
		} else if(form.contents.value == "" || form.contents.value == undefined) {
			alert("내용을 입력해주세요.");
			console.log(form.contents);
			form.contents.focus();
			return;
		} else {
			alert("저장되었습니다.");
			form.submit();
		}
	}
</script>