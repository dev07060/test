<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="bootstrap.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Caveat|Concert+One|Dancing+Script|Fredoka+One|Kalam|Kaushan+Script|Lobster|Luckiest+Guy|Merienda|Neucha|Sniglet|ZCOOL+QingKe+HuangYou&display=swap"
	rel="stylesheet">
<!-- style_dotnet.csa -->
<link rel="stylesheet" type="text/css" href="style_dotnet.css" />
<script type="text/javascript" src="jquery-3.4.1.js"></script>
	<script type="text/javascript" src="bootstrap.bundle.js"></script>
<style>
 #emialWin{
margin:10px;

} 
#mailCon{
display:none;
position:fixed;
bottom:0px;
right:0px;
width:500px;
}
#frId, #title, #content{
	border-top:0px;
	border-left:0px;
	border-right:0px;
	border-top-color: transparent;
	border-left-color: transparent;
	border-right-color: transparent;

}
#mailHead{
	background-color: rgba(227, 179, 255, 0.938);
	width:100%;
	height: 25px;
}
/* sendMail */
.sContent, .rContent{
	display: none;
}
.sTable:hover, .rTable:hover{
	cursor: pointer;
}
div.table{
	height:410px;
	overflow: auto;
}
#formTable > table > thead > tr > th:nth-child(1){
	width:8%;
}
#formTable > table > thead > tr > th:nth-child(2){
	width:8%;
}
#formTable > table > thead > tr > th:nth-child(3){
	width:15%;
}
#formTable > table > thead > tr > th:nth-child(5){
	width: 21%;
}


</style>
</head>

<body>


	<!-- 상단 바 -->

	<nav class="navbar navbar-expand-md navbar-default">
		<jsp:include page="../mainNav.do" flush="false"></jsp:include>
	</nav>
	<!-- 상단 바  끝-->


	<div class="container">
		<h4>마이페이지</h4>
		<hr style="margin:10px">
		<div class="row">
			<div class="col-sm-3 col-md-2">
				<div class="btn-group">
					<button type="button" class="btn btn-primary "
						id="writeEmail">쪽지 쓰기
						<!-- <span class="caret"></span> -->
					</button>

				</div>
			</div>
			<div class="col-sm-9 col-md-10">
				
				<button type="button" class="btn btn-default" data-toggle="tooltip"
					title="Refresh" onclick="history.go(0)">
					&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-refresh"></span>&nbsp;&nbsp;&nbsp;
				</button>
				<!-- Single button -->
				<div class="btn-group">
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Mark all as read</a></li>
						<li class="divider"></li>
						<li class="text-center"><small class="text-muted">Select
								messages to see more actions</small></li>
					</ul>
				</div>
				<div class="pull-right">
					<span class="text-muted"><b>1</b>–<b>50</b> of <b>160</b></span>
					<div class="btn-group btn-group-sm">
						<button type="button" class="btn btn-default">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</button>
						<button type="button" class="btn btn-default">
							<span class="glyphicon glyphicon-chevron-right"></span>
						</button>
					</div>
				</div>
			</div>
		</div>
		<hr style="margin:10px">
		<div class="row">
			<!-- 왼쪽 사이드  -->
			<div class="col-sm-3 col-md-2">
				<a href="#" class="btn btn-danger btn-sm btn-block" role="button"><i
					class="glyphicon glyphicon-edit"></i> Compose</a>
				<hr>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="#mail" data-toggle="tab" id="sideMail" ><!-- onclick="sideMailClick()" -->
					<span class="badge pull-right"></span> 쪽지 </a></li>
							
					<li><a href="#lib" data-toggle="tab" id="sideLib" >최근 기록</a></li>
					<li><a href="#myS" data-toggle="tab" id="sideWr" >내가 작성한 테스트</a></li>
					<li><a href="#" data-toggle="tab" id="sidePo">포인트 내역</a></li>
					<li><a href="#manageFr" data-toggle="tab" id="sideFr" >친구 관리</a></li>
					<li><a href="#modifyUser" data-toggle="tab" id="sideMy" >개인 정보 수정</a></li>

				</ul>
			</div>
			<!--왼쪽 사이드 끝  -->
			<!--내용-->
			<div class="col-sm-9 col-md-10 ">
				<div class="tab-content">
					<div class="tab-pane fade in active" id="mail">
						<ul class="nav nav-tabs" >
							<li style="margin-right: 10px;">
  							 <button type="button" class="btn btn-default btn-sm" 
  							 id="trash" >
          					<span class="glyphicon glyphicon-trash" ></span> Trash </button>
      					 	</li>
							<li><a data-toggle="tab" href="#send" id="tabSend" >보낸쪽지</a></li>
							<li><a data-toggle="tab" href="#receive" id="tabReceive" >받은쪽지</a></li>
						</ul>
					</div>

					<div class="tab-pane fade in" id="lib">
						<ul class="nav nav-tabs">
							<li><a data-toggle="tab" href="#recent" id="tabRecent">최근설문 목록</a></li>
							<li><a data-toggle="tab" href="#like" id="tab">최근설문 상세</a></li>
						</ul>
					</div>
					<div class="tab-pane fade in" id="manageFr">
						<ul class="nav nav-tabs">
							<li><a data-toggle="tab" href="#myFr" id="tabMyFr">내 친구</a></li>
							<li><a data-toggle="tab" href="#recomFr" id="tabRecomFr">추천 친구</a></li>
						</ul>
					</div>
					
					<div class="tab-pane fade in" id="myS">
						<ul class="nav nav-tabs">
							<li><a data-toggle="tab" href="#myss" id="tabMyFr">내가 작성한 설문</a></li>
							<li><a data-toggle="tab" href="#myd" id="tabRecomFr">설문 상세</a></li>
						</ul>
					</div>						
					
				</div>
				<div class="tab-content" id="realContent" >
					<!--쪽지  -->
					<div class="tab-pane fade in active" id="send">
						<div class="table">
							<table class="table table-fixed">
								<jsp:include page="../sendMail.do"></jsp:include>
							</table>
						</div>
					</div>
					<div class="tab-pane fade in " id="receive">
						<div class="table">
							<table class="table table-fixed">
								<jsp:include page="../receiveMail.do"></jsp:include>
							</table>
						</div>
					</div>
					<!-- 최근설문 링크저장 -->
					<div class="tab-pane fade in" id="recent">
						<jsp:include page="../userRecentSurvey.do"></jsp:include>
					</div>
					
					<div class="tab-pane fade in" id="detail">
						<ul>
							<li>like</li>
							<li>liklike</li>
						</ul>
					</div>
					
					<!-- 네 친구관리 링크저장 -->
					<div class="tab-pane fade in" id="myFr">
					<div class="table">
							<table class="table table-fixed">
								<jsp:include page="../myFr.do"></jsp:include>
							</table>
							</div>
					</div>
					
					<!-- 친구 추천 링크저장 -->
					<div class="tab-pane fade in" id="recomFr">
						<div class="table">
							<table class="table table-fixed">
								<jsp:include page="../recomFr.do"></jsp:include>
							</table>
							</div>
					</div>
					<!-- 회원정보수정 링크저장 -->
					<div class="tab-pane fade in" id="modifyUser">
						<div class="table">
							<table class="table table-fixed">
								<jsp:include page="../modifyUser.do"></jsp:include>
							</table>
						</div>
					</div>
					
					<!-- 내 설문 관리 링크저장 -->
					<div class="tab-pane fade in" id="myss">
								<jsp:include page="../userMySurvey.do"></jsp:include>
					</div>
					
				</div>
			</div>

		</div>
	</div>
	
<div class="container" id="mailCon">
<!--     <div class="modal-dialog cascading-modal"> -->
        <div class="shadow bg-white">
            <!--Content-->
			<div id="mailHead">
			<button type="button" class="close" aria-label="Close">
			  <span aria-hidden="true">&times;</span>
			</button>
			</div>
            <form id="emailWin" action="sendMailPro.do" method="post">
                <div class="form-group">
                    <label for="frId">받을 사람 ID</label>
                    <input type="text" class="form-control" id="frId" name="frId" placeholder="">
                </div>
                <div class="form-group">
                    <label for="title">제목</label>
                    <input type="text" class="form-control" id="title" name="title" autocomplete=”off” placeholder="">
                </div>
                <div class="form-group">
                    <label for="content">글 내용</label>
                    <textarea class="form-control" id="content" name="content" rows="10"></textarea>
                </div>
                <div class="form-group right">
                    <input type="submit" class="btn btn-info" id="emailBtn" onclick="return checkMail();">
                    <input type="reset" class="btn btn-info" >
                </div>
            </form>
        </div>
<!--     </div> -->
</div>
<c:set var = "id" value="${sessionScope.memId }"/>

<script>
// $(document).ready(function(){
	
// 	$("#emailBtn").on('click', 
// 		function(){
// 			var data = {"id", ${id}}
// 			$.ajax(){
// 				type: "POST",
//                 dataType: "json",
//                 data: data,
// 				url:'alarm.do',
// 				success: function(data){
					
// 				},
// 				error:function(e){
// 					alert("error alarm");
// 				}
				
				
// 			}	
			
// 		}
// 	}
		
// });
	
</script>
	<script >
	//
		//쪽지
		$("#sideMail").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#send").addClass('active show');
		});
		$("#tabSend").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#send").addClass('active show');
		});
		$("#tabReceive").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#receive").addClass('active show');
		});
		//최근
		$("#sideLib").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#recent").addClass('active show');
		});
		$("#tabRecent").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#recent").addClass('active show');
		});
		$("#tabLike").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#like").addClass('active show');
		});
		//내 설문
		$("#sideLib").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#recent").addClass('active show');
		});
		$("#tabRecent").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#recent").addClass('active show');
		});
		$("#tabLike").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#like").addClass('active show');
		});
		//친구
		$("#sideFr").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#myFr").addClass('active show');
		});
		$("#tabMyFr").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#myFr").addClass('active show');
		});
		$("#tabRecomFr").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#recomFr").addClass('active show');
		});
		
	</script>
	<script>
		$('#writeEmail, .close').on('click', function(){
			$('#mailCon').toggle("slow");
		})
		
		function checkMail(){
			if(!$("#frId").val() || !$("#content").val() || !$("#title").val()){
				alert("빠진 부분을 확인해 주세요")
				return false;
			}
			
		};
	</script>
	<!-- 	sendMial -->
<script>
// var json ={s :[] , r:[]};
var json = new Object();
var	pJson = new Object();
var jsonStr;
$(document).ready(function(){
	
	$('.sTable').click(function(){
		if(event.target.nodeName != 'INPUT'){
			var idx = $(this).index(); 
			$('.sContent').eq(idx/2).toggle(100);
		}
	});
	
	$('.rTable').click(function(){
		if(event.target.nodeName != 'INPUT'){
			
			var idx = $(this).index(); 
			$('.rContent').eq(idx/2).toggle(100);
		}
	});
	// for delete chckbox checked mail formmat to JSON 
	
	
});
		
		
	
	
	
	/* for tab active */  //나중에 하기로
	$("#tabSend").on('click',function(){
		$(this).css("border-color","rgba(227, 179, 255, 0.938)");
		$("#tabReceive").css("border-color","transparent")
	});
	$("#tabReceive").on('click',function(){
		$(this).css("border-color","rgba(227, 179, 255, 0.938)");
		$("#tabSend").css("border-color","transparent")
	});
	
// 	인터넷
// 	$("#checkAll").click(function() {
//		$("input[name=box]:checkbox").each(function() {
//			$(this).attr("checked", true);
//		});
//	});
	$('#topCheckS').on('click',function(){
		if($(this).is(':checked')){
			$('.sTable > th > input[type=checkbox]').prop('checked',true);
		}else{
			$('.sTable > th > input[type=checkbox]').prop('checked',false);
		}
	});
	$('#topCheckR').on('click',function(){
		if($(this).is(':checked')){
			$('.rTable > th > input[type=checkbox]').prop('checked',true);
		}else{
			$('.rTable > th > input[type=checkbox]').prop('checked',false);
		}
	});
	
   
    
    $(document).ready(function () {
    	
    	$('input[type=checkbox]').on('click',function(){
    		/* var selected = [];
    		$('input:checked').each(function() {
    		    selected.push($(this).attr('id'));
    		});
    		var Ob = [];
    		$.each(selected, function(index,item){
    		Ob.push(item.split('_'))   }  );  

    			
    		
    		var is = 0 , ir = 0;
    		for(var i = 0 ; i < Ob.length; i++){
    		  	  json.Ob[i][0]=Ob[i][1]
    		}
    		console.log(json); */
    		var selected = [];
    		$('input:checked').each(function() {
    		    selected.push($(this).attr('id'));
    		});
    		var Ob =[];
    		$.each(selected, function(index,item){
    		Ob.push(item.split('_'))   }  );  

//     		var json = new Object();	

    		for(var i = 0 ; i < Ob.length; i++){
    		    json[Ob[i][0]]=Ob[i][1]
    		}
    		
    		jsonStr = JSON.stringify(json);
//     		console.log("JSON.parse(jsonStr) : " + JSON.parse(jsonStr))
//     		console.log("jsonStr : "+jsonStr);
    		
    /* 		var is = 0 , ir = 0;
    		for(var i = 0 ; i < Ob.length; i++){
    			if(Ob[i][0].includes('s')){
    		  	  json.s[is]=Ob[i][1]
    		  	  is++;
    			}else{
    				json.r[ir]=Ob[i][1]
    				ir++;
    			}
    		} */
    	});
    	
        $("button[id=trash]").on('click', function () {
            if ($('input[type=checkbox]').is(':checked')) {
                if (confirm("정말 삭제하시겠습니까??") == true) {    //확인
// 					console.log("josn : " + json);
//                 	console.log("jsonStr : " + jsonStr)
                	var pJson = {"val" : jsonStr }
//                 	console.log(pJson)
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        data: pJson,
//                         contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
                        url: "deleteMail.do",
                        success: function (data) {
                            location.reload();
                        },
                        error: function (e) {
                            console.log("ajax 실패")
                        }
                    });//ajax 끝

                } else {   //취소
                    return false;
                }
            } else {
                alert('선택된 쪽지가 없습니다.');
                return false;
            }
        });

    });
</script>

</body>

</html>