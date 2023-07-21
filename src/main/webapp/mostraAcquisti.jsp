<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Acquisto" %>
<%@ page import="Model.AcquistoCoinvolgimento" %>
<%@ page import="Model.Coinvolgimento" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Mostra Acquisti</title>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
    <link rel="stylesheet" href="css/CssComune.css">
    <link rel="stylesheet" type="text/css" href="./css/homepage.css"/>
    <link rel="stylesheet" type="text/css" href="./css/footer.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<main>
  
    <ol>
        <%
            ArrayList<AcquistoCoinvolgimento> acquistoCoinvolgimentoLista = (ArrayList<AcquistoCoinvolgimento>) request.getAttribute("acquisti");
            for (AcquistoCoinvolgimento ac : acquistoCoinvolgimentoLista) {
        %>
        <li>
            <div>
                <h1><%=ac.getAcquisto().getData() + " " + ac.getAcquisto().getImporto()%>€</h1>
                <ul>
                    <%for (Coinvolgimento c : ac.getProdottiCoinvolti()) {%>
                    <li>
                        <%=c.getProdotto().getNome() + " " + c.getQuantita()%>
                    </li>
                    <%}%>
                </ul>
            </div>
        </li>
        <%}%>
    </ol>
</main>

<footer >
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>
