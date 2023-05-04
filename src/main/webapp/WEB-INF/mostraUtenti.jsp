<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Cliente" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mostra utenti</title>
</head>
<style>
    table, th, td {
        border: 1px solid black;
        border-collapse: collapse;
    }
</style>

<body>
<%ArrayList<Cliente> clienti = (ArrayList<Cliente>) request.getAttribute("clienti");%>
<table style="width:50%">
    <tr>
        <th>Id</th>
        <th>Nome e Cognome</th>
        <th>E-mail</th>
        <th>Admin</th>
    </tr>
    <%for (Cliente c : clienti) {%>
    <tr>
        <td><%=c.getId()%></td>
        <td><%= c.getNome() + " " + c.getCognome()%></td>
        <td><%=c.getEmail() %></td>
        <td><%=c.getAdminValue() %></td>
    </tr>
    <%}%>
</table>

</body>
</html>
