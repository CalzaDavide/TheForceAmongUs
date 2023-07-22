<%@ page import="Model.Cliente" %>
<%@ page import="com.mysql.cj.Session" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="it">

<head>
    <title>Header </title>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">

    <link rel="stylesheet" href="css/CssComune.css">
    <link rel="stylesheet" type="text/css" href="./css/header.css"/>
    <link rel="stylesheet" type="text/css" href="./css/footer.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">




  <script>
    // Ottieni il riferimento al form e al pulsante personalizzato
    const myForm = document.getElementById('searchbar');
    const customSubmitButton = document.getElementById('cerca');

    // Aggiungi un gestore di eventi al clic sul pulsante personalizzato
    customSubmitButton.addEventListener('click', function() {
      // Invia il modulo quando il pulsante personalizzato viene cliccato
      myForm.submit();
    });


  </script>
</head>
<body>


<%-- Sidebar --%>
<div class="barra">

    <span id="menu" onclick="openNav()">&#9776;</span>

    <%-- SideNav --%>
    <div id="mySidenav" class="sidenav">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <form action="mostra-prodotti"><input type="hidden" name="ricerca" value=""> <input class="submit" type="submit"
                                                                                            value="CATALOGO"></form>
        <form action="mostra-prodotti"><input type="hidden" name="tipologia" value="Pacchetto"> <input class="submit"
                                                                                                       type="submit"
                                                                                                       value="PACCHETTI">
        </form>
        <form action="mostra-prodotti"><input type="hidden" name="tipologia" value="Box"> <input class="submit"
                                                                                                 type="submit"
                                                                                                 value="BOX">
        </form>
        <form action="mostra-prodotti"><input type="hidden" name="tipologia" value="Carta"> <input class="submit"
                                                                                                   type="submit"
                                                                                                   value="CARTE"></form>
        <a href="info.jsp">INFO</a>
        <a href="contatti.jsp">CONTATTI</a>
    </div>

    <script>
        function openNav() {
            document.getElementById("mySidenav").style.width = "320px";
        }

        function closeNav() {
            document.getElementById("mySidenav").style.width = "0";
        }
    </script>

    <%-- Logo --%>
    <div>
        <a href="#">
            <img id="logo" src="images/LogoSito.jpg" alt="Logo">
        </a>
    </div>

    <%-- Searchbar --%>
    <div id="searchbar">
        <form action="mostra-prodotti">
            <input type="text" name="ricerca">
            <button id="cerca">
              <img src="images/iconaCerca.png" alt="Cerca">
            </button>
        </form>
    </div>


</div>

</body>
</html>
