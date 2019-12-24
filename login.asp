<!-- #include file="DBConnect.asp" -->
<%
    Dim matin
    matin = request.querystring("matin")
    Dim connection_string
    connection_string = "DRIVER={Microsoft Access Driver (*.mdb, *.accdb)}; DBQ="
    connection_string = connection_string & Server.mappath("254461_TranMinhTuan.accdb") & ";"
    Dim dbman, result
    Set dbman = (New DBManager)(connection_string) 

    Dim username  
    Dim password

    username = request.form("username")
    password = request.form("password")

    Set result = dbman.query("Select * from User where username='"&username&"' and password='" &password&"' ", empty)

    If result.EOF Then 
    Response.write("<script>alert('Dang nhap Khong thanh cong')</script>")
    else 
    Session("user")=username
    Response.redirect("admin.asp")
    End If
    
%>
<!DOCTYPE html>
<html lang="en">
    <head>
    <title>Details</title>
    <meta http-equiv="content-type" charset="UTF-8" content="text/html; charset=utf-8">
    
    <link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.min.css">
        
    </head>
    <style> 
    /* Bordered form */
form {
  border: 3px solid #f1f1f1;
}

/* Full-width inputs */
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

/* Add a hover effect for buttons */
button:hover {
  opacity: 0.8;
}

/* Extra style for the cancel button (red) */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Center the avatar image inside this container */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

/* Avatar image */
img.avatar {
  width: 40%;
  border-radius: 50%;
}

/* Add padding to containers */
.container {
  padding: 16px;
}

/* The "Forgot password" text */
span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
    display: block;
    float: none;
  }
  .cancelbtn {
    width: 100%;
  }
}
    </style>
    <body>
    <form action="login.asp" method="post">
  <div class="imgcontainer">
    <h2>LOGIN</h2>
  </div>

  <div class="container">
    <label for="uname"><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="username" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="password" required>

    <button type="submit">Login</button>
    <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label>
  </div>

  <div class="container" style="background-color:#f1f1f1">
    <button type="button" class="cancelbtn">Cancel</button>
    <span class="psw">Forgot <a href="#">password?</a></span>
  </div>
</form>
    </body>
</html>