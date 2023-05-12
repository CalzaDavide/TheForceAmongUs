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
%>

<h1>Benvenuto, <%= cliente.getNome()%>!</h1>

<fieldset>
    <legend>Dati personali</legend>
    <p>Email: <%= cliente.getEmail()%></p>
    <p>Password: <%= cliente.getPswd()%>    (Aggiungere pulsante modifica password)</p>
    <p>Saldo: <%= cliente.getSaldo()%> SusCoins </p>
    <form action="ricarica-saldo">
        <label for="ricarica">Ricarica saldo:</label>
        <input type="number" id="ricarica" name="ricarica" value="10">
        <input type="submit" value="ricarica saldo">
    </form>
</fieldset>

<fieldset>
    <legend>Dati Spedizione</legend>
    <p><%= cliente.getNome()%> <%= cliente.getCognome()%></p>
    <p><%= cliente.getIndirizzo_Via()%> <%= cliente.getN_Civico()%></p>
    <p><%= cliente.getCodice_Postale()%>, Italia</p>
</fieldset>

</body>
</html>
