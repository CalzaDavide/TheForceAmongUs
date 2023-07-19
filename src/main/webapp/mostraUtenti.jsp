<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Cliente" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Mostra utenti</title>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
    <link rel="stylesheet" href="css/CssComune.css">
    <link rel="stylesheet" type="text/css" href="./css/Tabelle.css"/>
</head>

<body>
<%ArrayList<Cliente> clienti = (ArrayList<Cliente>) request.getAttribute("clienti");%>
<table>
    <tr>
        <th>Nome e Cognome</th>
        <th>E-mail</th>
        <th>Password</th>
        <th>Admin</th>
    </tr>
    <%for (Cliente c : clienti) {%>
    <tr>
        <td><%= c.getNome() + " " + c.getCognome()%></td>
        <td><%=c.getEmail() %></td>
        <td><%=c.getPswd() %></td>
        <%if (c.isAdmin()){%>
            <td id="isAdmin"></td>
        <%}else{%>
            <td id="isNotAdmin"></td>
        <%}%>
    </tr>
    <%}%>
</table>

</body>
</html>
