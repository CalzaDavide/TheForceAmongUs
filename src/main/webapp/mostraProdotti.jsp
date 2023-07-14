<%@ page import="Model.Prodotto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Cliente" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
    <title>Prodotti</title>
    <link rel="stylesheet" type="text/css" href="./css/MostraProdotti.css"/>
</head>


<body>

<h1>Prodotti</h1>

<%Cliente utente = (Cliente) session.getAttribute("utente");%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<%if (utente != null) {%>
<script>
    function aggiungiCarrello(idProdotto) {
        $.post("aggiungi-carrello",
            {prodotto: idProdotto},
        )
    }
</script>
<%}%>

<%ArrayList<Prodotto> prodotti = (ArrayList<Prodotto>) request.getAttribute("prodotti");%>

<%-- Prodotti --%>
<section class="prodotti">

    <!-- It's likely you'll need to link the card somewhere. You could add a button in the info, link the titles, or even wrap the entire card in an <a href="..."> -->

    <%for (Prodotto p : prodotti) {%>
    <div class="prodotti-card">
        <div class="prodotti-image">
            <img src="images/Icona.ico">
        </div>
        <div class="prodotti-info">
            <h5><%=p.getNome()%>
            </h5>
            <h6><%if (p.getPercentuale_sconto() == 0) {%>
                <%=p.getCosto()%>
                <%} else {%>
                <del><%=p.getCosto()%>
                </del>
                <%=p.getPrezzoScontato()%>
                <%}%>€
            </h6>
            <p onclick="aggiungiCarrello(<%=p.getId()%>)"><input type="button" value="Aggiungi al carrello"></p>
        </div>
    </div>
    <%}%>


</section>


</body>


</html>
