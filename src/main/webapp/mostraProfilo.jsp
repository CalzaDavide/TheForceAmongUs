<%@ page import="Model.Cliente" %>
<%@ page import="com.mysql.cj.Session" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head><title>Home Page</title>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
    <link rel="stylesheet" href="css/CssComune.css">
    <link rel="stylesheet" href="css/mostraProfilo.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>

<header >
    <jsp:include page="header.jsp" />
</header>

<main>
    <% Cliente cliente = (Cliente) session.getAttribute("utente"); %>

    <div id="mostraProfilo">


        <div id="benvenuto">
            <h1>Benvenuto, <%= cliente.getNome()%> !</h1>
        </div>

        <div id="informazioniPersonali">

            <h2>EMAIL : </h2>
            <p><%= cliente.getEmail()%></p>
            <br>
            <h2>PASSWORD : </h2>
            <p>**********</p>

        </div>

        <div id="datiSpedizione">

            <h2>NOME E COGNOME : </h2>
            <p><%= cliente.getNome().toUpperCase()%><%= cliente.getCognome().toUpperCase()%></p>
            <br>
            <h2>INDIRIZZO : </h2>
            <p><%= cliente.getIndirizzo_Via().toUpperCase()%> , <%= cliente.getN_Civico()%> , cliente.getCodice_Postale() , ITALIA</p>
            <br>


        </div>
    </div>

</main>

<footer>
    <jsp:include page="footer.jsp"/>
</footer>

</body>
</html>
