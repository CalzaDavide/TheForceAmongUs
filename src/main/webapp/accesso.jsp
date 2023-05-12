<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head><title>Log-in</title>
</head>
<body>

<%  String logInStatus = (String) session.getAttribute("logInStatus");
    if(logInStatus != null && logInStatus.equals("errato")){%>
    <h1>Credenziali Errate</h1><%}%>

<br/>

<form action="login" method="post">

    <label for="email">Email:</label><br>
    <input type="email" id="email" name="email" value="John@john.com"><br><br>
    <label for="pswd">Password:</label><br>
    <input type="password" id="pswd" name="pswd" value="Pswd"><br><br>

    <input type="submit" value="Log in">
</form>

<a href="index.jsp">Home page</a>

</body>
</html>

