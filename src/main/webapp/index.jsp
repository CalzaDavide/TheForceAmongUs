<%@ page import="Model.Cliente" %>
<%@ page import="com.mysql.cj.Session" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="it">

<head>
    <title>Home Page </title>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
    <link rel="stylesheet" href="css/CssComune.css">
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
        <form action="mostra-prodotti"><input type="hidden" name="ricerca" value=""><input type="submit" value="CATALOGO"></form>
        <form action="mostra-prodotti"><input type="hidden" name="tipologia" value="Pacchetto"><input type="submit" value="PACCHETTI"></form>
        <form action="mostra-prodotti"><input type="hidden" name="tipologia" value="Box"><input type="submit" value="BOX"></form>
        <form action="mostra-prodotti"><input type="hidden" name="tipologia" value="Carta"><input type="submit" value="CARTE"></form>
        <a href="info.html">INFO</a>
        <a href="contatti.html">CONTATTI</a>
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
        <a href="accesso.jsp">ACCEDI</a>
        <a href="registrazione.jsp">REGISTRATI</a>
        <%} else {%>
        <h1>Benvenuto, <%= cliente.getNome().toUpperCase()%>!</h1>
        <form action="logout">
            <input type="submit" value="LOG OUT">
        </form>
        <form action="mostra-carrello">
            <input type="submit" value="CARRELLO">
        </form>
        <form action="mostra-acquisti">
            <input type="submit" value="VISUALIZZA ACQUISTI">
        </form>
        <%}%>
    </div>
        <% if (cliente != null && cliente.isAdmin()) {%>
        <form action="mostra-utenti">
            <input type=submit value="MOSTRA UTENTI">
        </form>
        <a href="aggiungiProdotto.jsp">AGGIUNGI PRODOTTO</a><br>
        <%}%>
</header>

<main>
    <h1>ULTIMA ESPANSIONE:</h1>
    <img src="images/ultimaEspansione">
    <form action="mostraProdotti.jsp">
        <input type="hidden" name="espansione" value="Rise of the Impostor">
        <input type="submit" value="SCOPRI ORA">
    </form>
</main>

<footer>
</footer>


</body>
</html>
