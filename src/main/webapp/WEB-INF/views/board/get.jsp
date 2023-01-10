<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>



<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Read</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">Board Read Page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="form-group">
				<label>번호</label><input class="form-control" name='bno'
						value='<c:out value="${board.bno}"/>' readonly="readonly">
				</div>
	
				<div class="form-group">
					<label>제목</label><input class="form-control" name='title'
						value='<c:out value="${board.title}"/>' readonly="readonly">
				</div>
	
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" rows="3" name='content'
						readonly="readonly"><c:out value="${board.content}" /></textarea>
				</div>
	
				<div class="form-group">
					<label>작성자</label><input class="form-control" name='writer'
						value='<c:out value="${board.writer}"/>' readonly="readonly">
				</div>
				<button data-oper='modify' class="btn btn-default">수정</button>
					<%-- onclick="location.href='/board/modify?bno=<c:out value="${board.bno}"/>'" --%>
				<button data-oper='list' class="btn btn-info">목록</button>
					<!-- onclick="location.href='/board/list'" -->
				<form id='operForm' action="/board/modify" method="get">
					<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
					<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
					<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
					<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
					<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
				</form>
			</div>
			<!-- end panel-body -->

		</div>
		<!-- end panel panel-default -->
	</div>
	<!-- end col-lg-12 -->
</div>
<!-- /.row -->

<script type="text/javascript" src="/resources/js/reply.js"></script>


<script>
	$(document).ready(function(){
		
		var operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function(e){
			
			operForm.attr("action", "/board/modify").submit();
		});
		
		$("button[data-oper='list']").on("click", function(e){
					
			operForm.find("#bno").remove();
			operForm.attr("action", "/board/list").submit();
			
			
		});
		
		/* $(document).ready(function(){
			console.log(replyService);
		}); */
		
		console.log("============");
		console.log("JS TEST");
		
		var bnoValue = '<c:out value="${board.bno}"/>';
		
		replyService.add(
				{reply:"JS Test", replyer:"tester", bno:bnoValue}
				,
				function(result){
					alert("RESULT: " + result);
				}
		);
		
		replyService.getList({bno:bnoValue, page:1}, function(list){
			
			for(var i = 0, len = list.length||0; i < len; i++){
				console.log(list[i]);
			}
		});
		
		replyService.remove(23, function(count){
			
			console.log(count);
			
			if (count === "success") {
				alert("REMOVED");
			}
		}, function(err){
			alert("ERROR......");
		});
	});

</script>
<%@include file="../includes/footer.jsp"%>