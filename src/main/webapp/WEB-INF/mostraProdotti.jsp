<%@ page import="Model.Prodotto" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: aless
  Date: 04/05/2023
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mostra prodotti</title>
</head>
<body>
  <h1>Elenco Prodotti:</h1>
  <%
    ArrayList<Prodotto> prodotti = (ArrayList<Prodotto>)request.getAttribute("prodotti");

    for(Prodotto p : prodotti){%>
  <%=p.getId() + " / " + p.getNome()  + " / " + p.getTipologia() + " / " + p.getCosto()%><br><br>
  <%}%>
</body>
</html>
