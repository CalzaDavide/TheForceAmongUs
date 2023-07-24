<%@ page import="Model.Cliente" %>
<%@ page import="com.mysql.cj.Session" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="it">

<head>
    <title>Home Page </title>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
    <link rel="stylesheet" type="text/css" href="css/CssComune.css">
    <link rel="stylesheet" type="text/css" href="css/homepage.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>


<body>

<header >
    <jsp:include page="header.jsp" />
</header>

<%--%>
<main>
    <h1>ULTIMA ESPANSIONE:</h1>
    <img src="images/ultimaEspansione.jpg" alt="Ultima Espansione">
    <form action="mostra-prodotti">
        <input type="hidden" name="espansione" value="The rise of the impostor">
        <input type="submit" value="SCOPRI ORA">
    </form>
    <%--%>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>
    <p style="font-size: 50px">Prova</p>




<footer >
    <jsp:include page="footer.jsp" />
</footer>


</body>
</html>
