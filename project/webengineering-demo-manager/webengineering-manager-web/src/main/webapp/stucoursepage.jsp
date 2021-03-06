<%@page contentType="text/html" contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>课程管理</title>
		<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
		<script type="text/javascript" src="js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/学生主页.css" />
		<link rel="stylesheet" href="css/demo.css" />
		<link rel="stylesheet" href="css/normalize.css" />
		<link rel="stylesheet" href="css/searchstyle.css" />
		<link rel="stylesheet" href="css/导航栏样式.css" />
		<link rel="stylesheet" href="css/学生课程页面（总览）.css" />
	</head>

	<body class="container">
		<!--logo部分-->
		<div class="container">
			<div class="row" style="background: #c4c4c4;margin-left: 0px;margin-right: 0px;border-radius: 8px;">
				<div class="col-lg-8">
					<img src="img/logo3.png" style="height: 70px;" />
				</div>
				<div class="col-lg-4 text-right" style="padding-top: 30px;">
					<a href="#">个人中心</a>
					<a href="#">注销</a>
				</div>
			</div>
		</div>

		<!--导航栏-->
		<div class="container" style="margin-top: 10px;">
			<nav class="navbar navbar-default nav1 green" style="margin-top: 0px;">
				<div class="container-fluid">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#ToBeHidden" aria-expanded="false" style="color: white;">
					        <span class="sr-only">Toggle navigation</span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					        <span class="icon-bar"></span>
					    </button>
						<a class="navbar-brand" href="#" style="color: white;font-size: 25px;">首页</a>
					</div>

					<div class="collapse navbar-collapse" id="ToBeHidden">
						<ul class="nav navbar-nav">
							<li>
								<a href="#" style="color: white;font-size: 20px;">我的课程 <span class="sr-only">(current)</span></a>
							</li>
							<li>
								<a href="#" style="color: white;font-size: 20px;">我的作业</a>
							</li>
							<li>
								<a href="#" style="color: white;font-size: 20px;">我的讨论</a>
							</li>
						</ul>
						<script>
							function submitsearch() {
								$.ajax({
									type: "GET",
									url: "/searchCourse.action",
									data: {
										"searchclass": $("#searchcourse").val()
									},
									async: true,
									success: function() {
										/*showResult();*/
										/*alert("success");*/
										$("#SearchResult").show();
									},
									error: function() {
										alert("error");
									}
								});
							}
						</script>
						<form class="navbar-form navbar-right" role="search" style="margin-top: 5px;margin-bottom: 5px;">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="请输入你要加入的课程号" id="searchcourse" name="searchclass" style="border: 2px solid #324b4e;background: #F9F0DA;border-radius: 24px;">
							</div>
							<button type="button" class="btn btn-default" onclick="submitsearch()" style="border: 1px solid #324b4e;margin-left: 5px;">搜索</button>
						</form>
					</div>
				</div>
			</nav>
		</div>

		<!--课程-->
		<div class="container course courses">
			<div class="row">
				<c:forEach var="class" items="${classes}">
					<c:forEach var="course" items="${courses}">
						<c:if test="${class}.courseid == ${course}.courseid">
							<div class="col-lg-3 col-md-6 col-sm-6 col-xs-12 ">
								<div class="courseMessage" style="width: 250px;margin-top: 7px;">
									<div style="text-align: center;">
										<!--img-->
										<a href="#">
											<img src="img/课程.jpg" style="width: 240px; height: 150px;" />
										</a>
									</div>
									<div style="text-align: center;">
										<!--text-->
										<p>课程名称：<span>${course.coursename}</span></p>
										<p>班级<span>${class.classname}</span></p>
										<p>班级人数：<span>${class.personnum}</span></p>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:forEach>
			</div>
		</div>
		<!--分页-->
		<div class="container mypage">
			<ul class="pager" style="text-align:center; width: 100%;margin-bottom: 5px;">
				<li>
					<a> <span aria-hidden="true">&laquo;</span>
					</a>
				</li>
				<li>
					<a href="#">&lt;</a>
				</li>
				<li>
					<a href="#">1</a>
				</li>
				<li>
					<a href="#">2</a>
				</li>
				<li>
					<a href="#">3</a>
				</li>
				<li>
					<a href="#">4</a>
				</li>
				<li>
					<a href="#">5</a>
				</li>
				<li>
					<a href="#">&gt;</a>
				</li>
				<li>
					<a href="#" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</ul>
			<p style="text-align: center;font-family: '微软雅黑';margin-top: 0px;">
				共<span>几</span>页&nbsp;&nbsp;&nbsp;共<span>几</span>条
			</p>
		</div>
		<!--底部版权声明-->
		<div class="container">
			<div class="row text-center" id="below" style="margin-left: 0px;margin-right: 0px;border-radius: 8px;height: 50px;">
				<p>版权声明</p>
			</div>
		</div>
		<!--搜索结果（浮动）-->
		<script>
			function hiddenResult() {
				$("#SearchResult").hide();

			}
		</script>
		<div id="SearchResult" style="display: none; width: 400px;height: 336px; background-color: white;float: left;position: absolute;left: 30%;right: 50%;top: 30%;bottom: 50%; z-index: 1;">
			<div class="courseMessage" style="width: 400px;margin-top: 0px;background-image: url(img/背景1.jpg);">
				<div style="text-align: center;font-size: 20px;">
					<p>您查找的课程是否为：<span>课程名</span>？</p>
				</div>

				<div style="text-align: center;">
					<!--img-->
					<a href="#">
						<img src="img/课程.jpg" style="width: 240px; height: 150px;" />
					</a>
				</div>
				<div style="text-align: center;">
					<!--text-->
					<p>课程名称：<span>xxx</span></p>
					<p>任课教师：<span>xxx</span></p>
					<p>所选课程所在学校：<span>xxx</span></p>
					<p>班级人数：<span>xxx</span></p>
				</div>
				<div style="text-align: center;padding-bottom: 5px;">
					<p style="font-size: 18px;">您确定要选择加入该课程吗？</p>
					<button type="button" class="btn btn-default" style="margin-right: 100px;" onclick="hiddenResult()">确定</button>
					<button type="button" class="btn btn-default" onclick="hiddenResult()">取消</button>
				</div>

			</div>
		</div>
	</body>

</html>