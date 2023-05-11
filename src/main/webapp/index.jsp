<%@ page import="Model.Cliente" %>
<%@ page import="com.mysql.cj.Session" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head><title>Home Page</title>
    <link rel="icon" type="image/x-icon" href="images/Logo.ico">
</head>

<body>
<%
    Cliente cliente = (Cliente) session.getAttribute("utente");
    if (cliente == null) {
%>
<a href="accesso.jsp">Log-in</a><br>
<a href="registrazione.jsp">Registrazione</a><br>
<%} else {%>
<h1>Benvenuto, <%= cliente.getNome()%>!</h1>
<form action="logout">
    <input type="submit" value="Log out">
</form>
<%}
    if(cliente != null && cliente.isAdmin()){%>
<form action="mostra-utenti">
    <input type=submit value="Mostra Utenti">
</form>
<a href="prodotto.jsp">aggiungi prodotto</a><br>
<%}%>
<form action="mostra-prodotti">
    <input type=submit value="Mostra Prodotti">
</form>
<br>

</body>
</html>
