	<!-- #include file="DBConnect.asp" -->
    <%
    Dim connection_string
    connection_string = "DRIVER={Microsoft Access Driver (*.mdb, *.accdb)}; DBQ="
    connection_string = connection_string & Server.mappath("254461_TranMinhTuan.accdb") & ";"
    Dim dbman
    Set dbman = (New DBManager)(connection_string)
    Dim title
    Dim page
    Dim price
    Dim category
	Dim author
    title = request.form("title")
    page = request.form("page")
    category = request.form("category")
	price = request.form("price")
	author = request.form("author")
	detail = request.form("detail")
    Dim id
    id = request.querystring("id")
    Set rsa = dbman.query("Select * FROM Sach WHERE MaSach = ?", id)

    Dim result
    If IsEmpty(title) And IsEmpty(page) And IsEmpty(category) And IsEmpty(author) And IsEmpty(price) And IsEmpty(detail) Then
    Else
    Set result = dbman.query("UPDATE Sach set TieuDe = '"&title&"',Trang = '"&page&"',Gia = '"&price&"',TacGia = '"&author&"',MaTheLoai = '"&category&"' ,NoiDung = '"&detail&"' where MaSach = " & id, empty)
    Response.redirect "admin.asp"
    End If
%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Bootstrap CRUD Data Table for Database with Modal Form</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style> 
    	/* Modal styles */
		.modal .modal-dialog {
			max-width: 400px;
		}

		.modal .modal-header,
		.modal .modal-body,
		.modal .modal-footer {
			padding: 20px 30px;
		}

		.modal .modal-content {
			border-radius: 3px;
		}

		.modal .modal-footer {
			background: #ecf0f1;
			border-radius: 0 0 3px 3px;
		}

		.modal .modal-title {
			display: inline-block;
		}

		.modal .form-control {
			border-radius: 2px;
			box-shadow: none;
			border-color: #dddddd;
		}

		.modal textarea.form-control {
			resize: vertical;
		}

		.modal .btn {
			border-radius: 2px;
			min-width: 100px;
		}

		.modal form label {
			font-weight: normal;
		}
    </style>
</head>
<body>
			<div >
				<form action="" method="POST">
					<div class="modal-header">
						<h4 class="modal-title">Edit Book</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Tieu De</label>
							<input name="title" type="text" class="form-control" value="<% Response.write(Server.HTMLEncode(rsa("TieuDe"))) %>"  required>
						</div>
						<div class="form-group">
							<label>Tac Gia</label>
							<input name="author" type="text" value="<% Response.write(rsa("TacGia")) %>" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Trang</label>
							<input type="text" name="page" class="form-control" value="<% Response.write(rsa("Trang")) %>" required>
						</div>
						<div class="form-group">
							<label>Gia </label>
							<input name="price" type="text" value="<% Response.write(rsa("Gia")) %>" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Noi Dung </label>
							<input name="detail" type="text" class="form-control" value="<% Response.write(Server.HTMLEncode(rsa("NoiDung"))) %>" required>
						</div>
						<div class="form-group">
							<label>The Loai </label>
							<input name="category"  value="<% Response.write(rsa("MaTheLoai")) %>" type="text" class="form-control" required>
						</div>

					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
						<input type="submit" class="btn btn-info" value="Save">
					</div>
				</form>
			</div>
</body>
</html>