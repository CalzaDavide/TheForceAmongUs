<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Cliente" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Mostra utenti</title>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
    <link rel="stylesheet" type="text/css" href="./css/homepage.css"/>
</head>
<style>
    table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
    }
</style>

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
            <td class="isAdmin"></td>
        <%}%>
        <% if (!c.isAdmin()){%>
            <td class="isNotAdmin"></td>
        <%}%>
    </tr>
    <%}%>
</table>

</body>
</html>
