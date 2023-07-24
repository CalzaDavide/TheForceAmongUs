<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.OggettoQuantita" %>
<%@ page import="Model.Cliente" %>
<%@ page import="java.util.Locale" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
    <link rel="stylesheet" href="css/cssComune.css">
    <link rel="stylesheet" href="css/carrello.css">
    <title>Carrello</title>
</head>

<body>

<header>
    <jsp:include page="header.jsp" />
</header>

<main>
    <%Double totale = Double.parseDouble(String.format(Locale.US, "%.2f", request.getAttribute("totale")));
    ArrayList<OggettoQuantita> carrello = (ArrayList<OggettoQuantita>) request.getAttribute("carrello");%>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script>
        var tot = <%=totale%>;
        var n = <%=carrello.size()%>
            //Per non ricaricare la pagina ogni volta che si rimuove un prodotto dal carrello,
            //utilizziamo ajax
            function rimuoviCarrello(idProdotto, quantita, costo) {
            $.post("rimuovi-carrello", //servlet da chiamare
                {prodotto: idProdotto}, //parametri nel body della richiesta
                function () {
                    $("." + idProdotto).remove();
                    tot -= (quantita * costo).toFixed(2);
                    tot = tot.toFixed(2);
                    $("#totale").text("TOTALE: " + tot + "€");
                    n--;
                    if(n<=0){
                        carrelloVuoto();
                    }
                } //funzione di callback: aggiorna la pagina modificando il dom
            )
        }
        //se il carrello è vuoto, il tasto per l'acquisto e il totale non vengono visualizzati;
        //appare invece il messaggio "Il tuo carrello è vuoto!"
        function carrelloVuoto(){
            $("#acquista").remove();
            $("#totale").remove();
            $("#listaProdotti").append("<h1 style='margin: auto;'> Il tuo carrello e' vuoto !</h1>");

        }
    </script>

    <div class="carrello">
        <div class="listaProdotti" id="listaProdotti">
            <a href="index.jsp">
                <img style="margin: 2% 20% 10% 20%" src="images/LogoSito.jpg" alt="Logo" class="logo">
            </a>
            <br>
            <%if(carrello.isEmpty()){%>
            <h1>Il tuo carrello e' vuoto!</h1>
            <%}else{%>
                <span id="p">
                    <!-- Per ogni oggetto nel carrello sono visualizzate le informazioni.
                     Ogni oggetto ha il proprio id_Prodotto come classe, per potervi accedere facilmente-->
                    <% for (OggettoQuantita oq : carrello) {
                        int id = oq.getProdotto().getId();%>
                    <p class="<%=id%>">x<%=oq.getQuantita()%> &emsp; <%=oq.getProdotto().getNome().toUpperCase()%></p> <p class="<%=id%>" style="font-size: 15px">&emsp; (<%=oq.getQuantita()* oq.getProdotto().getCosto()%>€) </p>  <%--  &emsp; è uno spazio di 4 caratteri  --%>
                    <input id="rimuovi"  value="RIMUOVI" class="<%=id%>"
                           onclick="rimuoviCarrello(<%=id%>, <%=oq.getQuantita()%>, <%=oq.getProdotto().getPrezzoScontato()%>)"><br>
                    <%}%>
                </span>

                <h1 id="totale">TOTALE: <%=totale%>€</h1>
                <%if (session.getAttribute("utente") != null) {%>
                <form action="acquisto"><input id="acquista" type="submit" value="PROCEDI ALL'ACQUISTO"></form>
                <%}%>
            <%}%>
        </div>
    </div>

</main>

<footer>
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>
