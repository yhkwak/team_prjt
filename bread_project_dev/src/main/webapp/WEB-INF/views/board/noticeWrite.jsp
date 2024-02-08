<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/noticeWrite.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/noticeWrite.css">
<title>공지사항 글쓰기</title>
</head>
<body>
	
	<div id="wrap">
		<section id="container-content">
			<h2>공지사항 쓰기</h2>
			<hr>
			<form action="${pageContext.request.contextPath}/board/noticeWriteProcess.do" id="frm_write" name="frm_write" method="post" enctype="multipart/form-data">
				<table id="table-main">
					<tr id="tr-title">
						<th class="td-main">제목</th>
						<td class="td-input"><input type="text" name="title" id="input-title"></td>
					</tr>
					<tr>
						<th class="td-main">내용</th>
						<td class="td-input"><textarea name="content" id="content" rows="15" cols="40"></textarea></td>
					</tr>
					<tr>
						<th class="td-main">첨부파일</th>
						<td class="td-input"><input type="file" name="uploadFile" ></td>
					</tr>
				</table>
				<div>
					<input type="button" value="취소하기">
					<input type="submit" value="등록하기" id="submitBtn">
				</div>
			</form>
		</section>
	</div>
</body>
<!-- <script>
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 oAppRef: oEditors,
	 elPlaceHolder: "content",
	 sSkinURI: "${pageContext.request.contextPath}/resources/se2/SmartEditor2Skin.html",
	 fCreator: "createSEditor2"
	});
</script> -->

<script>
// 페이지 로드 시 SmartEditor 초기화
var oEditors = [];
window.onload = function() {
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "content",
        sSkinURI: "${pageContext.request.contextPath}/resources/se2/SmartEditor2Skin.html",
        fCreator: "createSEditor2"
    });
};

// "등록하기" 버튼 클릭 시 실행되는 함수
document.getElementById('submitBtn').addEventListener('click', function(event) {
    event.preventDefault(); // 폼 기본 제출 동작 방지

    // SmartEditor 내용을 textarea에 업데이트
    oEditors[0].exec("UPDATE_CONTENTS_FIELD", []); // 첫 번째 에디터 인스턴스 사용

    var formData = new FormData(document.getElementById('frm_write'));

    // fetch API를 사용하여 폼 데이터 제출
    fetch('${pageContext.request.contextPath}/board/noticeWriteProcess.do', {
        method: 'POST',
        body: formData,
    })
    .then(response => {
        if (response.ok) {
            return response.text(); // 또는 response.json() 등 서버 응답에 맞게 처리
        }
        throw new Error('Network response was not ok.');
    })
    .then(data => {
        alert('글 작성이 완료되었습니다.');
        window.close(); // 현재 창 닫기
        window.opener.location.reload(); // 부모 창 새로고침
    })
    .catch(error => {
        console.error('글 작성 중 오류가 발생했습니다.', error);
        alert('글 작성 중 오류가 발생했습니다.');
    });
});
</script>
</html>