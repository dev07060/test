<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="setting_user.jsp"%>




<title>나의 최근 참여 설문</title>

<style>
th {
	text-align: center;
}
</style>
<body>
	<div class="container">
		<hr>
		
										<!--메인 게시판 리스트 -->
		<h4>메인게시판</h4>
		<br>
		<table class="table table-hover text-center">
			<thead>
				<tr>
					<th>${str_sur_type}</th>
					<th>${str_title}</th>
					<th>${str_write_date}</th>
					<th>${str_part_date}</th>
				</tr>
			</thead>
			<c:if test="${cnt == 0}">
				<tr>
					<td colspan="6" align="center">${msg_list}</td>
				</tr>
			</c:if>
			<c:forEach var="boardDto" items="${surveys}">
				<c:if test="${cnt != 0 and boardDto.b_tp_num == 1 }">
					<tbody>
						<tr>
							<td align="center">${type}<c:set var="type"
									value="${boardDto.s_tp_num}" />
							</td>
							<td align="center"><a style="cursor:hand;">${boardDto.subject}</a></td>
							<td align="center"><fmt:formatDate
									value="${boardDto.s_date}" type="both"
									pattern="yyyy-MM-dd HH:mm" /></td>
							<td align="center"><fmt:formatDate
									value="${boardDto.s_date}" type="both"
									pattern="yyyy-MM-dd HH:mm" /></td>
						</tr>
					</tbody>	
				</c:if>
			</c:forEach>
		</table>
		<hr>
		<br> <br> <br> <br>
										<!--서브 게시판 리스트 -->
		<h4>유저게시판</h4>
		<br>
		<table class="table table-hover text-center">
			<thead>
				<tr>
					<th>${str_sur_type}</th>
					<th>${str_title}</th>
					<th>${str_write_date}</th>
					<th>${str_part_date}</th>
				</tr>
			</thead>
			<c:if test="${cnt == 0}">
				<tr>
					<td colspan="6" align="center">${msg_list}</td>
				</tr>
			</c:if>
			<c:forEach var="boardDto" items="${surveys}">
				<c:if test="${cnt != 0 and boardDto.b_tp_num == 2 }">
					<tbody>
						<tr>
							<td align="center">${type}<c:set var="type"
									value="${boardDto.s_tp_num}" />
							</td>
							<td align="center"><a style="cursor:hand;">${boardDto.subject}</a></td>
							<td align="center"><fmt:formatDate
									value="${boardDto.s_date}" type="both"
									pattern="yyyy-MM-dd HH:mm" /></td>
							<td align="center"><fmt:formatDate
									value="${boardDto.s_date}" type="both"
									pattern="yyyy-MM-dd HH:mm" /></td>
						</tr>
					</tbody>
				</c:if>
			</c:forEach>
		</table>
	</div>
</body>
