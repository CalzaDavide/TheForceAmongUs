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
<table class="title">
  <tr><th>Gestione dei clienti</th></tr>

</table>


<ol>
  <c:forEach items="${clienti}" var="clienti">
    <li>${clienti.firstName} ${clienti.lastName} ${clienti.balance}
      <form action="update-customer">
        <input type="hidden" name="id" value="${clienti.id}">
        <input type="submit" value="Modifica">
      </form>
    </li>
  </c:forEach>


</ol>

</body>
</html>
