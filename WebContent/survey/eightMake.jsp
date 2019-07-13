<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>8문 8답 만들기</title>
		
		<!-- bootstrap css -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		
		<!-- responsive(반응형)을 위한 meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		
		<!-- css for this page -->
		<style type="text/css">
			.dad {
			  padding-top: 5px;
			  padding-bottom: 5px;
			  display: table-cell;
			  /* float: left;
				position: relative; */
			  height: 237px;
			  width: 200px;
			  vertical-align: middle;
			  text-align: center;
			  color: #37474F;
			  background-color: #FFFFFF;
			  border: solid 2px #333333;
			  border-radius: 10px;
			}
			img {
			  display: none;
			  height: 203px;
			  width: 192px;
			}
		</style>
	</head>
	<body>
		
		<form action="eightPro.do" method="post">
			<!-- 글제목, 포인트 작성 -->
			<div class="row justify-content-center mt-5 ml-5 pl-5">
				<div class="form row w-75" id="topDiv">
					<div class="form-group col-md-8">
						<label> 제목 </label>
						<input type="text" class="form-control" name="subject" placeholder="글 제목을 적어주세요">
						<br>
						<label> 포인트 </label>
						<input type="text" class="form-control" name="point" placeholder="포인트">
					</div>
					<div class="dad" id="userActions1" ondragover="dragOver()" >
			            <img id="img1" alt="uploaded image placeholder">
			            <p>Drag &amp; Drop Image</p> <input type="file" id="fileUpload1" name="upload1" multiple accept="image/*">
		          	</div>
				</div>
			</div>
			
			<!-- 캐로슬(슬라이딩) - 질문 및 보기 작성 -->
			<div id="eightCarousel" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
					    <!-- 첫번째 질문(기본화면) -->
					    <div class="container-fluid mt-5" id="QBox1">
				  			<div class="row justify-content-center">
								<div class="form-group row w-75">
									<label class="col-sm-2 col-form-label text-right">Q1</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" name="Q1" placeholder="질문을 작성해주세요">
									</div>
								</div>
							</div>
				  			<div class="row justify-content-center">
							    <c:set var="num" value="${1}"/>
							    <c:forEach begin="1" end="4">
								    <div class="form-group row w-75">
									    <label class="col-sm-2 col-form-label text-right">${num}</label>
									    <div class="col-sm-10">
									      <input type="text" class="form-control" name="Q1Sel${num}" placeholder="보기${num}">
									    </div>
									</div>
								<c:set var="num" value="${num+1}"/>
								</c:forEach>
				  			</div>
				  		</div>
					</div>
					<!-- 2~8번 질문 슬라이드 만드는 for문 -->
					<c:set var="Qnum" value="${2}"/>
					<c:forEach begin="2" end="8">				
						<div class="carousel-item">
							<div class="container-fluid mt-5" id="QBox${Qnum}">
					  			<div class="row justify-content-center">
									<div class="form-group row w-75">
										<label class="col-sm-2 col-form-label text-right">Q${Qnum}</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" name="Q${Qnum}" placeholder="질문을 작성해주세요">
										</div>
									</div>
								</div>
					  			<div class="row justify-content-center">
								    <c:set var="num" value="${1}"/>
								    <c:forEach begin="1" end="4">
									    <div class="form-group row w-75">
										    <label class="col-sm-2 col-form-label text-right">${num}</label>
										    <div class="col-sm-10">
										      <input type="text" class="form-control" name="Q${Qnum}Sel${num}" placeholder="보기${num}">
										    </div>
										</div>
									<c:set var="num" value="${num+1}"/>
									</c:forEach>
					  			</div>
					  		</div>
						</div>
						<c:set var="Qnum" value="${Qnum+1}"/>
					</c:forEach>
				</div>
			</div>
		
			<!-- 버튼 모음 -->
			<div class="row justify-content-center">
				<button type="button" class="btn btn-outline-primary m-3" name="prevButton">이전</button>
				<input type="submit" class="btn btn-outline-primary m-3" value="작성완료">
				<input type="reset" class="btn btn-outline-primary m-3" value="작성취소">
				<button type="button" class="btn btn-outline-primary m-3" name="nextButton">다음</button>
			</div>
			<input type="hidden" name="s_tp_num" value="8">
		</form>
		
		
		
		
		
		<!-- bootstrap js -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	
	
	
		<!-- event for this page -->
		<script type="text/javascript" src="/DotNet/survey/DAD1.js"></script>
		<script type="text/javascript">
		//<!--
			
			jQuery(document).ready(
				function(){
					// 슬라이드 자동으로 넘어가는 것 방지
					jQuery("#eightCarousel").carousel('pause');
					
					// 파일업로드 버튼 숨기기
					jQuery("input[type=file]").attr("hidden",true);
					
					// 이전, 다음 버튼 누르면 넘어가도록
					jQuery("button[name=prevButton]").on(
						"click",
						function(){
							jQuery("#eightCarousel").carousel('prev');
						}
					);
					jQuery("button[name=nextButton]").on(
						"click",
						function(){
							jQuery("#eightCarousel").carousel('next');
						}
					);
				}		
			);
		//-->
		</script>
	</body>
</html>