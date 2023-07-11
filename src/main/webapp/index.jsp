<%@ page import="Model.Cliente" %>
<%@ page import="com.mysql.cj.Session" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="it">

<head>
    <title>Home Page </title>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
    <link rel="stylesheet" type="text/css" href="./css/homepage.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>


<body>
<header>


    <%-- Sidebar --%>
    <span id="menu" onclick="openNav()">&#9776;</span>

        <a href="#">
            <img src="images/LogoSito.jpg" alt="Logo" class="logo">
        </a>

    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <a href="index.jsp">Catalogo</a>
        <a href="index.jsp">Pacchetti</a>
        <a href="index.jsp">Box</a>
        <a href="index.jsp">Carte</a>
        <a href="index.jsp">Info</a>
        <a href="index.jsp">contatti</a>
    </div>

    <script>
        function openNav() {
            document.getElementById("mySidenav").style.width = "250px";
        }

        function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
        }
    </script>


    <%-- Searchbar --%>
    <div style="float:left" id="searchbar">
        <form action="mostra-prodotti">
            <input type="text" name="ricerca">
            <input type="submit" value="CERCA">
        </form>
    </div>


    <%-- Nome Utente --%>
    <div id="account">
        <%
            Cliente cliente = (Cliente) session.getAttribute("utente");
            if (cliente == null) {
        %>
        <a href="accesso.jsp">Accedi</a>
        <a href="registrazione.jsp">Registrati</a>
        <%} else {%>
        <h1>Benvenuto, <%= cliente.getNome()%>!</h1>
        <form action="logout">
            <input type="submit" value="Log out">
        </form>
        <form action="mostra-carrello">
            <input type="submit" value="Carrello">
        </form>
        <form action="mostra-acquisti">
            <input type="submit" value="Visualizza acquisti">
        </form>
        <%}%>
    </div>
</header>


<main>
</main>

<footer>
</footer>
<br>
<% if (cliente != null && cliente.isAdmin()) {%>
<form action="mostra-utenti">
    <input type=submit value="Mostra Utenti">
</form>
<a href="prodotto.jsp">aggiungi prodotto</a><br>
<%}%>


</body>
</html>
