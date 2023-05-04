<%@ page import="Model.Prodotto" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mostra prodotti</title>
</head>
<style>
    table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
    }
</style>

<body>
<%ArrayList<Prodotto> prodotti = (ArrayList<Prodotto>) request.getAttribute("prodotti");%>
<table style="width:70%">
    <tr>
        <th>Id</th>
        <th>Nome</th>
        <th>Quantità</th>
        <th>Percentuale sconto</th>
        <th>Costo</th>
        <th>Espansione</th>
        <th>Tipologia</th>
    </tr>
    <%for (Prodotto p : prodotti) {%>
    <tr>
        <td><%=p.getId()%></td>
        <td><%=p.getNome()%></td>
        <td><%=p.getQuantita()%></td>
        <td><%=p.getPercentuale_sconto() + "%"%></td>
        <td><%=p.getCosto()%></td>
        <td><%=p.getEspansione()%></td>
        <td><%=p.getTipologia() %></td>
    </tr>
    <%}%>
</table>

</body>
</html>
