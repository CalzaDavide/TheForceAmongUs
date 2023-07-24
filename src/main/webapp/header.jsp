<%@ page import="Model.Cliente" %>
<%@ page import="com.mysql.cj.Session" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="it">

<head>
    <title>Header </title>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
    <link rel="stylesheet" href="css/cssComune.css">
    <link rel="stylesheet" type="text/css" href="./css/header.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <script>
        <%-- Barra Laterale --%>

        function openNav() {
            document.getElementById("mySidenav").style.width = "320px";
        }

        function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
        }


        <%-- Barra di ricerca --%>
        // Ottieni il riferimento al form e al pulsante personalizzato
        const searchBar = document.getElementById('searchbar');
        const searchBarSubmit = document.getElementById('cerca');

        // Aggiungi un gestore di eventi al clic sul pulsante personalizzato
        searchBarSubmit.addEventListener('click', function () {
            // Invia il modulo quando il pulsante personalizzato viene cliccato
            searchBar.submit();
        });


        <%-- Acquisti Passati Icona --%>
        // Ottieni il riferimento al form e al pulsante personalizzato
        const mostraAcquistiHeader = document.getElementById('mostraAcquistiHeader');
        const mostraAcquistiButton = document.getElementById('mostraAcquistiForm');

        // Aggiungi un gestore di eventi al clic sul pulsante personalizzato
        mostraAcquistiButton.addEventListener('click', function () {
            // Invia il modulo quando il pulsante personalizzato viene cliccato
            mostraAcquistiHeader.submit();
        });


        <%-- Carrello Icona --%>
        // Ottieni il riferimento al form e al pulsante personalizzato
        const carrelloHeader = document.getElementById('carrelloHeader');
        const customCarrelloButton = document.getElementById('carrelloForm');

        // Aggiungi un gestore di eventi al clic sul pulsante personalizzato
        customCarrelloButton.addEventListener('click', function () {
            // Invia il modulo quando il pulsante personalizzato viene cliccato
            carrelloHeader.submit();
        });


        <%-- LogOut Icona --%>
        // Ottieni il riferimento al form e al pulsante personalizzato
        const logoutHeader = document.getElementById('logoutHeader');
        const customLogOutButton = document.getElementById('logOutForm');

        // Aggiungi un gestore di eventi al clic sul pulsante personalizzato
        customLogOutButton.addEventListener('click', function () {
            // Invia il modulo quando il pulsante personalizzato viene cliccato
            logoutHeader.submit();
        });

    </script>

</head>
<body>


<%-- Sidebar --%>
<div class="barra">

    <span id="menu" onclick="openNav()">&#9776;</span> <%--&#9776; è il simbolo con 3 righe --%>

    <%-- SideNav --%>
    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <form action="mostra-prodotti"><input type="hidden" name="ricerca" value="">
            <input class="submit" type="submit" value="CATALOGO">
        </form>

        <form action="mostra-prodotti"><input type="hidden" name="tipologia" value="Pacchetto">
            <input class="submit" type="submit" value="PACCHETTI">
        </form>

        <form action="mostra-prodotti"><input type="hidden" name="tipologia" value="Box">
            <input class="submit" type="submit" value="BOX">
        </form>

        <form action="mostra-prodotti"><input type="hidden" name="tipologia" value="Carta">
            <input class="submit" type="submit" value="CARTE">
        </form>

        <a href="info.jsp">INFO</a>
        <a href="contatti.jsp">CONTATTI</a>
    </div>

    <%-- Logo --%>
    <div>
        <a href="index.jsp">
            <img id="logo" src="images/LogoSito.jpg" alt="Logo">
        </a>
    </div>

    <%-- Searchbar --%>
    <div id="searchbar">
        <form action="mostra-prodotti" id="cercaForm">
            <button id="cerca">
                <img style="transform: scaleX(-1);" src="images/iconaCerca.png" alt="Cerca">
            </button>
            <input type="text" name="ricerca" id="cercaInput">

        </form>
    </div>

    <div></div>

        <%Cliente cliente = (Cliente) session.getAttribute("utente");%>
        <%  if (!(cliente == null)) {%>

    <div class="nomeUtenteAccediRegistrati">
        <h1 id="nomeUtente">Benvenuto, <%= cliente.getNome().toUpperCase()%>!</h1>
    </div>


    <div id="accountHeader">

        <div id="mostraProfiloHeader">
            <a href="mostraProfilo.jsp">
                <img src="images/profiloIcona.png" alt="PROFILO">
            </a>
        </div>

        <div id="carrelloHeader">
            <form action="mostra-carrello">
                <button id="carrelloForm">
                    <img src="images/carrelloHeaderIcona.png" alt="CARRELLO">
                </button>
            </form>
        </div>

        <div id="mostraAcquistiHeader">
            <form action="mostra-acquisti">
                <button id="mostraAcquistiForm">
                    <img src="images/ordiniPassatiIcona.png" alt="LOG OUT">
                </button>
            </form>
        </div>

        <div id="logoutHeader">
            <form action="logout">
                <button id="logOutForm">
                    <img src="images/logoutIcona.png" alt="LOG OUT">
                </button>
            </form>
        </div>
    </div>

        <%} else {%>
    <div id="nomeUtenteAccediRegistrati">
        <a href="accesso.jsp">ACCEDI &nbsp;</a>
        <a href="registrazione.jsp">REGISTRATI</a>
    </div>
        <%}%>

</body>
</html>
