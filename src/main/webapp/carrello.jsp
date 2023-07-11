<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.OggettoQuantita" %>
<%@ page import="Model.Cliente" %>
<%@ page import="java.util.Locale" %><%--
  Created by IntelliJ IDEA.
  User: aless
  Date: 24/06/2023
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
    <title>Carrello</title>
    <style>
        li{
            float: left;
            padding-right: 20px;
        }
    </style>
</head>
<body>
    <%Cliente utente = (Cliente) session.getAttribute("utente");
    Double totale = Double.parseDouble(String.format(Locale.US, "%.2f", request.getAttribute("totale")));
    %>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script>
        var tot = <%=totale%>;

        function rimuoviCarrello(idProdotto, quantita, costo){
            $.post("rimuovi-carrello",
                {prodotto: idProdotto},
                function(){
                    $("." + idProdotto).remove();
                    tot -= (quantita*costo).toFixed(2);
                    tot=tot.toFixed(2);
                    $("#totale").text("TOTALE: " + tot + "€");
                }
            )
        }

        function acquisto(){
            $.post("acquisto",
                function(){
                    $("ul *").remove();
                    tot = 0;
                    $("#totale").text("TOTALE: 0€");
                }
            )
        }
    </script>

    <% ArrayList<OggettoQuantita> carrello = (ArrayList<OggettoQuantita>) request.getAttribute("carrello");%>
    <h1>Carrello:</h1>
    <ul>
        <% for(OggettoQuantita oq : carrello){
        int id = oq.getProdotto().getId();%>
            <li class="<%=id%>"><%=oq.getProdotto().getNome()%> (<%=oq.getQuantita()%>)</li>
            <input type="button" value="RIMUOVI" class="<%=id%>" onclick="rimuoviCarrello(<%=id%>, <%=oq.getQuantita()%>, <%=oq.getProdotto().getPrezzoScontato()%>)"><br>
        <%}%>
    </ul>
    <h1 id="totale">TOTALE: <%=totale%>€</h1>
    <input type = "button" value="PROCEDI ALL'ACQUISTO" onclick="acquisto()">
</body>
</html>
