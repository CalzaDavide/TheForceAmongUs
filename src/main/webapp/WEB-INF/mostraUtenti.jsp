<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Cliente" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Mostra utenti</title>
  <link rel="stylesheet"
        href="./css/styles.css"
        type="text/css"/>
</head>
<body>
<h1>Elenco clienti:</h1><br>
<%
  ArrayList<Cliente> clienti = (ArrayList<Cliente>)request.getAttribute("clienti");
  for(Cliente c : clienti){%>
    <%=c.getId() + ") " + c.getNome() + c.getCognome() + c.getEmail()%><br><br>
  <%}%>

</body>
</html>
