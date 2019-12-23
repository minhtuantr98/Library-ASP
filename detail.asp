<!-- #include file="DBConnect.asp" -->
<%
    Dim matin
    matin = request.querystring("matin")
    Dim connection_string
    connection_string = "DRIVER={Microsoft Access Driver (*.mdb, *.accdb)}; DBQ="
    connection_string = connection_string & Server.mappath("254461_TranMinhTuan.accdb") & ";"
    Dim dbman, result
    Set dbman = (New DBManager)(connection_string) 

    set result = dbman.query("SELECT * From tintuc where matin= ?",matin)

%>

<!DOCTYPE html>
<html lang="en">
    <head>
    <title>Details</title>
    <meta http-equiv="content-type" charset="UTF-8" content="text/html; charset=utf-8">
    
    <link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.min.css">
        
    </head>
    <body>
        <div class="container text-center">
            <div class="row">
                <div class="col-md-12 header"><h1 style="color: Green">Nội dung bản tin <% Response.write(Server.HTMLEncode(result("tieude"))) %></h1></div>
            </div>
            <br>
            <div class="col-md-4">
            <img  src="/images/<% Response.write(result("duongdananh")) %>" width="300px" height="200px">
                <span style="font-size:20px;color:black;display:block">Chú thích :<% Response.write(result("chuthichanh")) %></span>
            </div>
            <div class="col-md-8">
                <div>
                    <h2 style="font-size:30px;color:black">Trích dẫn :<% Response.write(Server.HTMLEncode(result("trichdan"))) %></h2>
                    <p style="font-size:20px;color:black">Nội dung :<% Response.write(Server.HTMLEncode(result("noidung"))) %></p>
                    <b style="font-size:30px;color:red">Tác giả :<% Response.write(Server.HTMLEncode(result("tacgia"))) %></b>
                </div>
            </div>
        </div>
    </body>
</html>