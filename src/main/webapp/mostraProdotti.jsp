<%@ page import="Model.Prodotto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Cliente" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
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
<table style="width:70%">
    <tr>
        <th>Id</th>
        <th>Nome</th>
        <th>Percentuale sconto</th>
        <th>Costo</th>
        <th>Espansione</th>
        <th>Tipologia</th>
    </tr>
        <%for (Prodotto p : prodotti) {%>
    <tr>
        <td><%=p.getId()%></td>
        <td><%=p.getNome()%></td>
        <td><%=p.getPercentuale_sconto() + "%"%></td>
        <td>
            <%if(p.getPercentuale_sconto()==0){%>
                <%p.getCosto();%>
            <%}else{%>
                <del><%=p.getCosto()%></del>
                <%=p.getPrezzoScontato()%>
            <%}%>
        </td>
        <td><%=p.getEspansione()%></td>
        <td><%=p.getTipologia() %></td>
        <%if(utente != null){%>
        <td onclick="aggiungiCarrello(<%=p.getId()%>)"><input type="button" value = "Aggiungi al carrello"></td>
        <%}%>
    </tr>
    <%}%>
</table>

</body>
</html>
