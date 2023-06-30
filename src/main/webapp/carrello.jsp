<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.OggettoQuantita" %>
<%@ page import="Model.Cliente" %><%--
  Created by IntelliJ IDEA.
  User: aless
  Date: 24/06/2023
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Carrello</title>
    <style>
        li{
            float: left;
            padding-right: 20px;
        }
    </style>
</head>
<body>
    <%Cliente utente = (Cliente) session.getAttribute("utente");%>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script>
        function rimuoviCarrello(idProdotto){
            $.post("rimuovi-carrello",
                {utente: <%=utente.getId()%>, prodotto: idProdotto},
                function(){
                    $("." + idProdotto).remove();
                    alert("Prodotto rimosso!");
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
            <input type="button" value="RIMUOVI" class="<%=id%>" onclick="rimuoviCarrello(<%=id%>)"><br>
        <%}%>
    </ul>
    <h1>TOTALE: <%=request.getAttribute("totale")%>€</h1>
</body>
</html>
