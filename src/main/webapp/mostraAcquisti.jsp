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
    <link rel="stylesheet" type="text/css" href="./css/mostraAcquisti.css"/>
    <link rel="stylesheet" type="text/css" href="./css/footer.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<main>


    <div class="contenitoreOrdini">
        <div class="ordini">
            <a href="index.jsp">
                <img style="margin: 2% 20% 10% 20%" src="images/LogoSito.jpg" alt="Logo" class="logo">
            </a>
            <br>
            <hr class="linea" />
            <%
                ArrayList<AcquistoCoinvolgimento> acquistoCoinvolgimentoLista = (ArrayList<AcquistoCoinvolgimento>) request.getAttribute("acquisti");
                for (AcquistoCoinvolgimento ac : acquistoCoinvolgimentoLista) {
            %>
            <div id="ordineSingolo">
                <p id="idOrdine">ID ORDINE #<%=ac.getAcquisto().getId()%> </p>
                <p id="prezzo">TOTALE: <%= ac.getAcquisto().getImporto() + "€"%></p>
                <p id="data">Effettuato in data <%=ac.getAcquisto().getData()%></p>

                    <%for (Coinvolgimento c : ac.getProdottiCoinvolti()) {%>
                     <p id="oggettoListaAcquisto">- <%=c.getProdotto().getNome() + " " + c.getQuantita() + " (" + c.getProdotto().getCosto()*c.getQuantita() + "€)"%></p>
                    <%}%>
            </div>
            <hr class="footerLinea" />
            <br>
            <%}%>
        </div>
    </div>
</main>

<footer >
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>
