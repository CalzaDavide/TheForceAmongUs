<%@ page import="Model.Cliente" %><%--
  Created by IntelliJ IDEA.
  User: aless
  Date: 23/07/2023
  Time: 12:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Grazie per l'acquisto!</title>
    <link rel="stylesheet" href="css/cssComune.css">
    <link rel="stylesheet" href="css/acquistoEffettuato.css">
</head>
<body>
<main>
    <div id="grazie">
        <h1>GRAZIE PER IL TUO ACQUISTO, <%=((Cliente)session.getAttribute("utente")).getNome().toUpperCase()%>!</h1>
        <h2>CLICCA <a href="index.jsp">QUI</a> PER RITORNARE ALLA HOME PAGE.</h2>
        <img src="images/ringraziamenti.jpg">
    </div>
</main>
</body>
</html>
