<!-- #include file="DBConnect.asp" -->
<% 
 Dim connection_string
    connection_string = "DRIVER={Microsoft Access Driver (*.mdb, *.accdb)}; DBQ="
    connection_string = connection_string & Server.mappath("254461_TranMinhTuan.accdb") & ";"
    Dim dbman
    Set dbman = (New DBManager)(connection_string)
        Dim id
            id = request.querystring("id")
            Set result = dbman.query("DELETE FROM Sach WHERE MaSach = ?", id) 
            Response.redirect "admin.asp"
    %>

