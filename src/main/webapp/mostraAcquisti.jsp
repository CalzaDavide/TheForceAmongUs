<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Acquisto" %>
<%@ page import="Model.AcquistoCoinvolgimento" %>
<%@ page import="Model.Coinvolgimento" %><%--
  Created by IntelliJ IDEA.
  User: aless
  Date: 03/07/2023
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Mostra Acquisti</title>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
</head>
<body>
<ol>
    <%ArrayList<AcquistoCoinvolgimento> acquistoCoinvolgimentoLista =(ArrayList<AcquistoCoinvolgimento>) request.getAttribute("acquisti");
    for(AcquistoCoinvolgimento ac : acquistoCoinvolgimentoLista)
    {%>
        <li>
            <div>
            <h1><%=ac.getAcquisto().getData() + " " + ac.getAcquisto().getImporto()%></h1>
            <ul>
                <%for(Coinvolgimento c : ac.getProdottiCoinvolti())
                {%>
                    <li>
                        <%=c.getProdotto().getNome() + " " + c.getQuantita()%>
                    </li>
                <%}%>
            </ul>
            </div>
        </li>
    <%}%>
</ol>
</body>
</html>
