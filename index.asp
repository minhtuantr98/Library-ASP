<!-- #include file="DBConnect.asp" -->
<html>

<head>
    <title>Thi Giua Ki</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="/bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="/bootstrap/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
    <link href="/bootstrap/css/sb-admin.css" rel="stylesheet">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet'
        type='text/css'>
    <link
        href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800'
        rel='stylesheet' type='text/css'>

    <!-- Custom styles for this template -->
    <link href="/bootstrap/css/clean-blog.min.css" rel="stylesheet">
</head>

<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand" href="index.asp">Start Book</a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.asp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.asp">Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Page Header -->
    <header class="masthead" style="background-image: url('/images/home-bg.jpg')">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
                    <div class="site-heading">
                        <h1>Library Book</h1>
                        <span class="subheading">System Develop by MinhTuanTr</span>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <form method="POST" class="col-12 align-self-center" style="width: 87%; padding-left: 200px;">
        <div class="container text-center">
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12 text-center">
                    <br>
                    <tbody>
                        <%
                                                Dim connection_string
                                                connection_string = "DRIVER={Microsoft Access Driver (*.mdb, *.accdb)}; DBQ="
                                                connection_string = connection_string & Server.mappath("254461_TranMinhTuan.accdb") & ";"
                                                Dim dbman 
                                                Set dbman = (New DBManager)(connection_string)
                                               
                                                %>
                        <% 
            Dim curPage 'trang hiện tại
            Dim numPerPage  'Số bản ghi trong 1 trang 
            
            Dim total 'tổng số bản ghi

            numPerPage = 3 

            if not IsEmpty(request.querystring("page")) then
                curPage = request.querystring("page")
            else 
                curPage = 1
            end if
            Set total = dbman.query("Select count(*) as total from Sach", empty)
            
            Dim per
            per = 0

            if not total.EOF then 
                per = total.Fields("total")
            end if

            Dim numPage
            if per mod 3 = 0 then
                numPage = per\3
            else
                numPage = per\3 + 1
            end if
            
            curPage = CInt(curPage)
           
        %>
                        <% 
            Dim rsa
            Dim num 
            Dim query
            if curPage = 1 then
                query = "SELECT TOP "&numPerPage&" * FROM (Sach INNER JOIN TheLoai on Sach.MaTheLoai = TheLoai.MaTheLoai)"
            else
                num = numPerPage * (curPage - 1)
                query = "SELECT TOP "&numPerPage&" * FROM (Sach INNER JOIN TheLoai on Sach.MaTheLoai = TheLoai.MaTheLoai) where Sach.MaSach not in (select top "&num&" MaSach from  Sach order by MaSach) order by MaSach"
            end if
            Set rsa = dbman.query(query, empty)
            %>
                        <div class="card-deck">
                            <%do while Not rsa.EOF%>
                            <div class="card">
                                <a href="/detail.asp?title=<% Response.write(rsa("TieuDe")) %>"><img class="card-img-top" src="/images/<% Response.write(rsa("DuongDanAnh")) %>" alt="This picture is not Available"
                                    width="300px" height="200px" style="padding-left:30px;padding-right:30px;margin-top:30px" ></a>
                                <div class="card-body">
                                    <h5 class="card-title"><% Response.write(rsa("TieuDe")) %></h5>
                                    <ul class="list-group">
                                        <li class="list-group-item list-group-item-secondary"><i class="fa fa-user"
                                                style="font-size:20px;"></i> Tac Gia :
                                            <% Response.write(rsa("TacGia"))  %></li>
                                        <li class="list-group-item list-group-item-secondary"><i
                                                class="fa fa-book" style="font-size:20px;"></i> The Loai
                                            :<% Response.write(rsa("TenTheLoai")) %></li>
                                        <li class="list-group-item list-group-item-secondary"><i class="fas fa-scroll"
                                                style="font-size:20px;"></i> Trang : <% Response.write(rsa("Trang")) %>
                                        </li>
                                        <li class="list-group-item list-group-item-secondary"><i class="fa fa-inr"
                                                style="font-size:20px;"></i> Gia: <% Response.write(rsa("Gia")) %></li>
                                    </ul>

                                </div>
                            </div>
                            <div class="sep"></div>

                            <% rsa.MoveNext %>
                            <% loop %>
                        </div>



                        <div class="d-flex" style="justify-content: center;margin-top:50px">
                            <ul class="pagination">
                                <% for i = 1 to numPage 
                    if curPage = i then
                        Response.write("<li class='page-item active'>")
                    else 
                        Response.write("<li class='page-item '>")
                    end if
                        Response.write("<a href='/index.asp?page="&i&"' class='page-link'>"&i&"</a></li>")
                    Next
                %>
                            </ul>
                        </div>

                </div>
            </div>
    </form>

    <script>
        src = "/bootstrap/vendor/jquery/jquery.js"
    </script>
    <script>
        src = "/bootstrap/vendor/bootstrap/js/bootstrap.min.js"
    </script>
    <footer style="border-top:1px solid grey">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-10 mx-auto">
                    <ul class="list-inline text-center">
                        <li class="list-inline-item">
                            <a href="#">
                                <span class="fa-stack fa-lg">
                                    <i class="fas fa-circle fa-stack-2x"></i>
                                    <i class="fab fa-twitter fa-stack-1x fa-inverse"></i>
                                </span>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a href="#">
                                <span class="fa-stack fa-lg">
                                    <i class="fas fa-circle fa-stack-2x"></i>
                                    <i class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
                                </span>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a href="#">
                                <span class="fa-stack fa-lg">
                                    <i class="fas fa-circle fa-stack-2x"></i>
                                    <i class="fab fa-github fa-stack-1x fa-inverse"></i>
                                </span>
                            </a>
                        </li>
                    </ul>
                    <p class="copyright text-muted">Copyright &copy; MinhTuanTr ft NUCE</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Custom scripts for this template -->
    <script src="js/clean-blog.min.js"></script>
</body>

</html>