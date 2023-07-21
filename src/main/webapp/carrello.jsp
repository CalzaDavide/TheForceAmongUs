<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.OggettoQuantita" %>
<%@ page import="Model.Cliente" %>
<%@ page import="java.util.Locale" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
    <link rel="stylesheet" href="css/CssComune.css">
    <link rel="stylesheet" href="css/carrello.css">
    <title>Carrello</title>
</head>

<body>

<header></header>

<main>
    <%Double totale = Double.parseDouble(String.format(Locale.US, "%.2f", request.getAttribute("totale")));%>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script>
        var tot = <%=totale%>;

        function rimuoviCarrello(idProdotto, quantita, costo) {
            $.post("rimuovi-carrello",
                {prodotto: idProdotto},
                function () {
                    $("." + idProdotto).remove();
                    tot -= (quantita * costo).toFixed(2);
                    tot = tot.toFixed(2);
                    $("#totale").text("TOTALE: " + tot + "€");
                }
            )
        }

        function acquisto() {
            $.post("acquisto",
                function () {
                    $("#p *").remove();
                    tot = 0;
                    $("#totale").text("TOTALE: 0€");
                }
            )
        }
    </script>

    <% ArrayList<OggettoQuantita> carrello = (ArrayList<OggettoQuantita>) request.getAttribute("carrello");%>


    <div class="carrello">
        <div class="listaProdotti">
            <a href="index.jsp">
                <img style="margin: 2% 20% 10% 20%" src="images/LogoSito.jpg" alt="Logo" class="logo">
            </a>
            <br>
            <span id="p">
                <% for (OggettoQuantita oq : carrello) {
                    int id = oq.getProdotto().getId();%>
                <p class="<%=id%>">x<%=oq.getQuantita()%> &emsp; <%=oq.getProdotto().getNome().toUpperCase()%></p> <p class="<%=id%>" style="font-size: 15px">&emsp; (<%=oq.getQuantita()* oq.getProdotto().getCosto()%>€) </p>  <%--  &emsp; è uno spazio di 4 caratteri  --%>
                <input id="rimuovi"  value="RIMUOVI" class="<%=id%>"
                       onclick="rimuoviCarrello(<%=id%>, <%=oq.getQuantita()%>, <%=oq.getProdotto().getPrezzoScontato()%>)"><br>
                <%}%>
            </span>

            <h1 id="totale">TOTALE: <%=totale%>€</h1>
            <%if (session.getAttribute("utente") != null) {%>
            <input id="acquista" type="button" value="PROCEDI ALL'ACQUISTO" onclick="acquisto()">
            <%}%>

        </div>
    </div>

</main>

<footer></footer>
</body>
</html>
