<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    
    <title>Small Business - Start Bootstrap Template</title>
    
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <link href="css/styles.css" rel="stylesheet" />
 		<link rel="stylesheet" href="style.css">	
 		
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/scripts.js"></script>
    	<%@include file="css/js_css.html" %>
  <title>Steam Main Page</title>
</head>

<body style="background-color: black;">

<jsp:include page="nav.jsp"/>  

<!-- Page Content-->
        <!-- Call to Action-->
        <div class="card text-white bg-secondary my-5 py-4 text-center">
            <div class="card-body"><p class="text-white m-0">게임 리뷰 사이트 입니다.</p></div>
        </div>
        <!-- Content Row -->
       <div class="row gx-4 gx-lg-5" style="margin-left: 10px;">
    <!-- Card1 -->
<!-- Call to Action-->
        <!-- Content Row -->
        <div class="row gx-4 gx-lg-5">
            <!-- Card1 -->
           <div class="col-md-4 mb-5">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="card-body">
                        <img alt="#" src="img/pubg.jpg" width="350px" style="max-width: 100%;
            height: auto;">
                    </div>
                    </div>
                    <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">더 보기</a></div>
                </div>
            </div>
            <!-- Card2 -->
            <div class="col-md-4 mb-5">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="card-body">
                        <img alt="#" src="img/highwatch.jpg" width="350px" style="max-width: 100%;
            height: auto;">
                    </div>
                    </div>
                    <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">더 보기</a></div>
                </div>
            </div>
            <!-- Card3 -->
            <div class="col-md-4 mb-5">
                <div class="card h-100">
                    <div class="card-body">
                        <div class="card-body">
                        <img alt="#" src="img/lol.jpg" width="350px" style="max-width: 100%;
            height: auto;">
                    </div>
                    </div>
                    <div class="card-footer"><a class="btn btn-primary btn-sm" href="#!">더 보기</a></div>
                </div>
            </div>
            <!-- ... (다른 카드들도 동일하게 수정) ... -->
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</body>
</html>