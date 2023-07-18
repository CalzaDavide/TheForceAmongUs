<%@ page import="Model.Prodotto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Cliente" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
    <link rel="stylesheet" type="text/css" href="./css/Prodotti.css"/>
    <title>Mostra prodotti</title>
</head>
<style>
    table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
    }
</style>

<body>
<%Cliente utente = (Cliente) session.getAttribute("utente");%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<%if(utente != null){%>
<script>
    function aggiungiCarrello(idProdotto){
        $.post("aggiungi-carrello",
            {prodotto: idProdotto},
        )
    }
</script>
<%}%>

<%ArrayList<Prodotto> prodotti = (ArrayList<Prodotto>) request.getAttribute("prodotti");%>

<div class="prodotti">
    <%for (Prodotto p : prodotti) {%>
    <div class="prodottoSingolo">
        <div class="fotoProdotto">
            <img src="<%=p.getImmagine()%>" alt="foto del prodotto <%=p.getNome()%>">
        </div>
        <div class="infoProdotto">
            <p id="nome"><%=p.getNome().toUpperCase()%></p>
            <p id="espansione"><%=p.getEspansione().toUpperCase()%></p>
            <p><%if(p.getPercentuale_sconto()==0){%>
                <%=p.getCosto()%>
                <%}else{%>
                <del><%=p.getCosto()%>€</del>
                <%=p.getPrezzoScontato()%>
                <%}%>€</p>
            <%if(utente != null){%>
            <div class="carrello">
                <input onclick="aggiungiCarrello(<%=p.getId()%>)" type="button" value = "Aggiungi al carrello">
            </div>
            <%}%>
        </div>
    </div>

    <%}%>
</div>

</body>
</html>