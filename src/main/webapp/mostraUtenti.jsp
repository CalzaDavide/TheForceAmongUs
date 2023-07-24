<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Cliente" %>
<%@ page import="Model.ClienteDAO" %>
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

    <%ArrayList<Cliente> clienti = (new ClienteDAO()).doRetrieveAll();%>
    <div id="contenitoreListaUtenti">
        <table>
            <tr>
                <th>NOME E COGNOME</th>
                <th>E-MAIL</th>
                <th>INDIRIZZO</th>
                <th>ADMIN</th>
                <th>ELIMINA</th>
            </tr>
            <%for (Cliente c : clienti) {%>
            <tr>
                <td><%= c.getNome() + " " + c.getCognome()%></td>
                <td><%=c.getEmail() %></td>
                <td><%=c.getIndirizzo_Via()%> <%=c.getN_Civico()%> , <%=c.getCodice_Postale()%> , ITALIA</td>
                <%if (c.isAdmin()) {%>
                <td id="isAdmin"></td>
                <%} else {%>
                <td id="isNotAdmin"></td>
                <td id="elimina"><form action="elimina-cliente">
                    <input type="hidden" name="cliente" value="<%=c.getEmail()%>">
                    <input type="submit" value="elimina">
                </form></td>
                <%}%>
            </tr>
            <%}%>
        </table>
    </div>

</main>

</body>
</html>
