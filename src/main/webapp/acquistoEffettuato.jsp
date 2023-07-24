<%@ page import="Model.Cliente" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Grazie per l'acquisto!</title>
    <link rel="icon"       type="image/x-icon" href="images/Icona.ico">
    <link rel="stylesheet" type="text/css"     href="css/cssComune.css">
    <link rel="stylesheet" type="text/css"     href="css/acquistoEffettuato.css">

    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<main>
    <div id="grazie">
        <h1>GRAZIE PER IL TUO ACQUISTO, <%=((Cliente)session.getAttribute("utente")).getNome().toUpperCase()%>!</h1>
        <h2>CLICCA <a href="index.jsp">QUI</a> PER RITORNARE ALLA HOME PAGE.</h2>
        <img src="images/ringraziamenti.jpg" alt="RINGRAZIAMENTI">
    </div>
</main>
</body>
</html>
