<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Cliente" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Mostra utenti</title>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
    <link rel="stylesheet" href="css/cssComune.css">
    <link rel="stylesheet" type="text/css" href="./css/mostraUtenti.css"/>
</head>

<body>
<% Cliente utente = (Cliente) session.getAttribute("utente");
    if (utente == null || !utente.isAdmin()) {%>
        <jsp:forward page="index.jsp"/>
    <%}
%>


<main>

    <%ArrayList<Cliente> clienti = (ArrayList<Cliente>) request.getAttribute("clienti");%>
    <div id="contenitoreListaUtenti">
        <table>
            <tr>
                <th>NOME E COGNOME</th>
                <th>E-MAIL</th>
                <th>PASSWORD</th>
                <th>ADMIN</th>
            </tr>
            <%for (Cliente c : clienti) {%>
            <tr>
                <td><%= c.getNome() + " " + c.getCognome()%></td>
                <td><%=c.getEmail() %></td>
                <td><%=c.getPswd() %></td>
                <%if (c.isAdmin()) {%>
                <td id="isAdmin"></td>
                <%} else {%>
                <td id="isNotAdmin"></td>
                <%}%>
            </tr>
            <%}%>
        </table>
    </div>

</main>

</body>
</html>
