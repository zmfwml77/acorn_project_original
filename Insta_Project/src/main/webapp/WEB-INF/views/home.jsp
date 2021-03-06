<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/home.jsp</title>
<jsp:include page="include/resource.jsp"></jsp:include>
</head>
<body>
<jsp:include page="include/navbar.jsp"></jsp:include>
<div class="container">
	<h1>인덱스 페이지 입니다.</h1>
	<ul>
		<li><a href="users/signup_form.do">회원가입</a></li>
		<li><a href="cafe/private/insertform.do">카페 글쓰러 가기</a></li>
		<li><a href="file/private/uploadform.do">파일 업로드 하러 가기</a></li>
	</ul>
</div>

<script>

	//팝업을 중앙에 띄우는 함수 
	function showPopup2(){
		PopupCenter("${pageContext.request.contextPath }/popup/popup_page2.jsp","팝업창", 800, 500);
	}
	
	//팝업을 중앙에 원하는 페이지를 원하는  크기로 띄우는 함수 
	function PopupCenter(url, title, w, h) {
		// Fixes dual-screen position                         Most browsers      Firefox
		var dualScreenLeft = window.screenLeft != undefined ? window.screenLeft : screen.left;
		var dualScreenTop = window.screenTop != undefined ? window.screenTop : screen.top;
		
		width = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
		height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;
		
		var left = ((width / 2) - (w / 2)) + dualScreenLeft;
		var top = ((height / 2) - (h / 2)) + dualScreenTop;
		var newWindow = window.open(url, title, 'scrollbars=yes, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
		
		// Puts focus on the newWindow
		if (window.focus) {
		    newWindow.focus();
		}
	}	
	
	<%
		//팝업창을 띄울지 여부
		boolean canPopup=true;
		Cookie[] cooks=request.getCookies();
		if(cooks!=null){
			for(Cookie tmp:cooks){
				//canPopup 이라는 키값으로 저장된 쿠키가 존재하면 
				if(tmp.getName().equals("canPopup")){
					//팝업을 띄우지 않도록 한다.
					canPopup=false;
				}
			}
		}
	%>
	
	//페이지 로딩 시점에 팝업을 조건부로 띄우기 
	<%if(canPopup){%>
		showPopup2();	
	<%}%>
	
</script>

</body>
</html>