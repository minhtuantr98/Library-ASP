<!-- #include file="DBConnect.asp" -->
<%
    Dim matin
    matin = request.querystring("matin")
    Dim connection_string
    connection_string = "DRIVER={Microsoft Access Driver (*.mdb, *.accdb)}; DBQ="
    connection_string = connection_string & Server.mappath("254461_TranMinhTuan.accdb") & ";"
    Dim dbman, result
    Set dbman = (New DBManager)(connection_string) 

    Dim title
    title = request.querystring("title")
    Set rsa = dbman.query("Select * FROM Sach WHERE TieuDe = ?", title)

%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Details Book</title>
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
    <div class="container" style="margin-top:200px">
        <div class="row">
            <div class="col-8">
                <img src="/images/<% Response.write(rsa("DuongDanAnh")) %>" width="600px" height="400px">
            </div>
            <div class="col-4">
                <h1><% Response.write(Server.HTMLEncode(rsa("TieuDe"))) %></h1>
                <p style="font-size:20px;color:black">Tac Gia:<% Response.write(rsa("TacGia")) %></p>
                <p style="font-size:20px;color:black">Trang :<% Response.write(Server.HTMLEncode(rsa("Trang"))) %></p>
                <p style="font-size:20px;color:black">Gia :<% Response.write(Server.HTMLEncode(rsa("Gia"))) %></p>
                <p style="font-size:20px;color:black">Noi Dung :<% Response.write(Server.HTMLEncode(rsa("NoiDung"))) %></p>
            </div>
            <br>
        </div>
    </div>
</body>

</html>