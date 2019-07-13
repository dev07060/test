<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>drag & drop</title>
	
	<!-- 자바스크립트 -->
	<script src="/DotNet/survey/script_survey.js"></script>
	
 	<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	  crossorigin="anonymous"></script>
	
	<!-- css -->
	<link rel="stylesheet" href="/DotNet/survey/style_survey.css">
	
	<!-- style_dotnet.csa -->
	<link rel="stylesheet" type="text/css" href="style_dotnet.css" />
	  
	<!-- BootStrap cdn 인터넷에서 끌어 사용-->
	<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
	<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
	<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
	<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>

	<link rel="stylesheet" href="bootstrap.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Caveat|Concert+One|Dancing+Script|Fredoka+One|Kalam|Kaushan+Script|Lobster|Luckiest+Guy|Merienda|Neucha|Sniglet|ZCOOL+QingKe+HuangYou&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" type="text/css" href="mainCss.css" />
	
	
	
	
	<style>
	.fixed-bottom{
	display: none;
	}
	
	a#MOVE_TOP_BTN { 
	    position: fixed; 
		left: 1500px; 
		bottom: 50px; 
	     display: none; 
	     z-index: 999; 
	}
	
	#postsCarousel > div > div > div.carousel-item.active > div
	{
		border: transparent;
	}
	button#searchButton{
	position:relative;
	border:0px;
	bottom: 10px;
	background-color:transparent;
	 
	
	}
	.search_input {
		position:relative;
		bottom:20px;
		color: white;
		font-size: 20px;
		border: 0;
		outline: 0;
		background: transparent;
		line-height: 40px;
		padding: 0 10px;
		width: 450px;
		
	
	}
	#no_search{
	display: none;
	}
	
	
	</style>
</head>

<body>
	<!-- 상단 바 -->
	
	<nav class="navbar navbar-expand-md navbar-default">
		<jsp:include page="../mainNav.do" flush="false"></jsp:include>
	</nav>
	<!-- 상단 바  끝-->

  <div class="container-fluid">
    <br>
    <div class="container">
      <form class="form-group" action="uploadPro.do" method="post" enctype="multipart/form-data" id="imgform">

			<!-- ////////////////설문기본정보//////////////// -->
            <div class="form-group d-flex justify-content-center">
              <label for="subject"> 제목 <input type="text" class="form-control " name="subject"></label>
            </div>
            <div class="form-group d-flex justify-content-center">
              <label for="point"> 포인트 <input type="text" class="form-control " name="point"></label>
            </div>
            <div class="dad" id="userActions11" ondragover="dragOver()" >
	            <img id="img11" alt="uploaded image placeholder">
	            <p>Thumbnail Image</p> <input type="file" id="fileUpload11" name="upload11" multiple accept="image/*">
          	</div>
            <br>

			<!-- ////////////////1번질문//////////////// -->
            <div class="form-group d-flex justify-content-center" style="clear:left">
              <label for="question1"> Q1 <input type="text" class="form-control " name="question1"></label>
            </div>
            <br>
			
			<!-- ////////////////1번질문 보기//////////////// -->
          	<div class="dad" id="userActions1" ondragover="dragOver()" >
	            <img id="img1" alt="uploaded image placeholder">
	            <p>Drag &amp; Drop Image</p> <input type="file" id="fileUpload1" name="upload1" multiple accept="image/*">
          	</div>
	        <div class="dad" id="userActions2"> 
	        	<img id="img2" src="" alt="uploaded image placeholder" />
	            <p>Drag &amp; Drop Image</p> <input type="file" id="fileUpload2" name="upload2" multiple accept="image/*" />
	        </div> <br>

			
			<!-- ////////////////2번질문//////////////// -->
            <div class="form-group d-flex justify-content-center" style="clear:left">
              <label for="question2"> Q2 <input type="text" class="form-control " name="question2"></label>
            </div>

			<!-- ////////////////2번질문 보기//////////////// -->
			<div class="dad" id="userActions3"> 
				<img id="img3" src="" alt="uploaded image placeholder" />
		        <p>Drag &amp; Drop Image</p> <input type="file" id="fileUpload3" name="upload3" multiple accept="image/*" />
	        </div>
			<div class="dad" id="userActions4"> 
				<img id="img4" src="" alt="uploaded image placeholder" />
				<p>Drag &amp; Drop Image</p> <input type="file" id="fileUpload4" name="upload4" multiple accept="image/*" />
			</div><br>

			<!-- ////////////////3번질문//////////////// -->
            <div class="form-group d-flex justify-content-center" style="clear:left">
              <label for="question3"> Q3 <input type="text" class="form-control " name="question3"></label>
            </div>
            
            <!-- ////////////////3번질문 보기//////////////// -->
			<div class="dad" id="userActions5"> 
				<img id="img5" src="" alt="uploaded image placeholder"/>
				<p>Drag &amp; Drop Image</p> <input type="file" id="fileUpload5" name="upload5" multiple accept="image/*" />
			</div>
			<div class="dad" id="userActions6"> 
				<img id="img6" src="" alt="uploaded image placeholder" />
				<p>Drag &amp; Drop Image</p> <input type="file" id="fileUpload6" name="upload6" multiple accept="image/*" />
			</div><br>

			<!-- ////////////////4번질문//////////////// -->
            <div class="form-group d-flex justify-content-center" style="clear:left">
              <label for="question3"> Q4 <input type="text" class="form-control " name="question4"></label>
            </div>
            
            <!-- ////////////////4번질문 보기//////////////// -->
			<div class="dad" id="userActions7"> 
				<img id="img7" src="" alt="uploaded image placeholder"/>
				<p>Drag &amp; Drop Image</p> <input type="file" id="fileUpload7" name="upload7" multiple accept="image/*" />
			</div>
			<div class="dad" id="userActions8"> 
				<img id="img8" src="" alt="uploaded image placeholder" />
				<p>Drag &amp; Drop Image</p> <input type="file" id="fileUpload8" name="upload8" multiple accept="image/*" />
			</div><br>
			
			<!-- ////////////////5번질문//////////////// -->
            <div class="form-group d-flex justify-content-center" style="clear:left">
              <label for="question3"> Q5 <input type="text" class="form-control " name="question5"></label>
            </div>
            
            <!-- ////////////////5번질문 보기//////////////// -->
			<div class="dad" id="userActions9"> 
				<img id="img9" src="" alt="uploaded image placeholder"/>
				<p>Drag &amp; Drop Image</p> <input type="file" id="fileUpload9" name="upload9" multiple accept="image/*" />
			</div>
			<div class="dad" id="userActions10"> 
				<img id="img10" src="" alt="uploaded image placeholder" />
				<p>Drag &amp; Drop Image</p> <input type="file" id="fileUpload10" name="upload10" multiple accept="image/*" />
			</div><br>
						
      </form>
    </div>
    
    
    <br> <br> <br>
    <div class="container">
      <div class="row justify-content-center">
        <div class="col">
      	  <button type="submit" class="btn btn-primary" form="imgform">save</button>
        </div>
       
        <div class="col">
          <button type="reset" class="btn btn-primary" form="imgform">reset</button>
        </div>
      </div>
     </div>
  </div>
  
  
 
  
  
  
  
  <script type="text/javascript" src="/DotNet/survey/DAD1.js"></script>
  <script>
	jQuery("input[type=file]").attr("hidden",true);
	
	/* 추가버튼 누르면 2~5번 질문 생성 
	jQuery("input[value='추가하기']").on(
		"click",
		function(){
			alert("ok");
			jQuery("#hideDiv").attr("class","visible");
		}
	); */
  </script>

</body>

</html>
