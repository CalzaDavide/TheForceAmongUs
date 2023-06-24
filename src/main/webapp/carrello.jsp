<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.OggettoQuantita" %><%--
  Created by IntelliJ IDEA.
  User: aless
  Date: 24/06/2023
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Carrello</title>
</head>
<body>
  <% ArrayList<OggettoQuantita> carrello = (ArrayList<OggettoQuantita>) request.getAttribute("carrello");%>
    <h1>Carrello:</h1>
    <ul>
        <% for(OggettoQuantita oq : carrello){ %>
            <li><%=oq.getProdotto().getNome()%> (<%=oq.getQuantita()%>)</li>
        <%}%>
    </ul>
</body>
</html>
