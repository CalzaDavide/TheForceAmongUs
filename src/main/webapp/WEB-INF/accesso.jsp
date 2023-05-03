<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head><title>Log-in</title>
</head>
<body>

<br/>
<fieldset>
  <legend>Accesso</legend>

  <form action="aggiungi-cliente">

    <label for="email">Email:</label><br>
    <input type="email" id="email" name="email" value="John@john.com"><br><br>
    <label for="pswd">Password:</label><br>
    <input type="text" id="pswd" name="pswd" value="pswd"><br><br>

    <input type="submit" value="aggiungi cliente">
  </form>
</fieldset>
<a href="../index.jsp">Home page</a>

</body></html>
