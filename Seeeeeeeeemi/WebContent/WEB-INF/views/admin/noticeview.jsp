<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Board board = (Board)request.getAttribute("viewBoard"); %>
<%@include file="/WEB-INF/views/admin/include/header.jsp" %>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">
	<!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="/resources/admin/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div>
  
  <%@include file="/WEB-INF/views/admin/include/sidemenu.jsp" %>
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-12">
            <h1 class="m-0">공지사항 상세보기</h1>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
     	<div class="container-fluid">
     		
     		<table class="table table-bordered">
				<tbody>
					<tr>
						<th>글번호</th>
						<td colspan="3" style="text-align:left;"><%=board.getBoardNo() %></td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3" style="text-align:left;"><%=board.getBoardTitle() %></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td style="text-align:left;"><%=board.getUserNick() %></td>
						<th>작성일</th>
						<td style="text-align:left;"><%=board.getBoardCreateDate() %></td>
					</tr>
					<tr>
						<td colspan="4" style="text-align:left; height:300px">
						<%=board.getBoardContent() %>
						</td>
					</tr>
				</tbody>
			</table>
			<button type="button" class="btn btn-primary" onclick="location.href='/admin/notice/list'">목록</button>
			<button type="button" class="btn btn-info" onclick="location.href='/admin/notice/delete'">삭제</button>
     	</div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
    <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong>
    All rights reserved.
    <div class="float-right d-none d-sm-inline-block">
      <b>Version</b> 3.1.0
    </div>
  </footer>

  

</div>
<%@include file="/WEB-INF/views/admin/include/footer.jsp" %>