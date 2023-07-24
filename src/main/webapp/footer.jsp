<%@ page contentType="text/html;charset=UTF-8"%>
<%@ page import="Model.Cliente" %>
<html>
<head>
    <title>footer</title>
    <link rel="icon"       type="image/x-icon" href="images/Icona.ico">
    <link rel="stylesheet" type="text/css"     href="css/cssComune.css">
    <link rel="stylesheet" type="text/css"     href="css/footer.css"/>

    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<div class="footer">
    <div class="contenitoreFooter">
        <div class="footerTop">     <%--
                                           La parte superiore del footer è suddivisa in 3 sezioni di Grid layout tramite 3 div, due visualizzabili sempre(Prodotti e Altro)
                                           ed una (Admin) visualizzabile solo se si è amministratore
                                    --%>

            <div> <%-- Div della sezione Prodotti--%>
                <h6 class="footerTitolo">PRODOTTI</h6>
                <ul class="listaFooter">
                    <li class="oggettoListaFooter">
                        <form action="mostra-prodotti" class="linkListaFooter">
                          <input type="hidden" name="ricerca" value="">
                          <input class="testoFooter" type="submit" value="CATALOGO"></form> <%-- Catalogo --%>
                    </li>
                    <li class="oggettoListaFooter">
                        <form action="mostra-prodotti" class="linkListaFooter">
                          <input type="hidden" name="tipologia" value="Pacchetto">
                          <input class="testoFooter" type="submit" value="PACCHETTI"></form> <%-- Pacchetti --%>
                    </li>
                    <li class="oggettoListaFooter">
                        <form action="mostra-prodotti" class="linkListaFooter">
                          <input type="hidden" name="tipologia" value="Box">
                          <input class="testoFooter" type="submit" value="BOX"></form> <%-- Box --%>
                    </li>
                    <li class="oggettoListaFooter">
                        <form action="mostra-prodotti" class="linkListaFooter">
                          <input type="hidden" name="tipologia" value="Carta">
                          <input class="testoFooter" type="submit" value="CARTE"></form> <%-- Carte --%>
                    </li>
                </ul>
            </div>


            <div> <%-- Div della sezione Altro--%>
                <h6 class="footerTitolo">ALTRO</h6>
                <ul class="listaFooter">
                    <li class="oggettoListaFooter">
                        <a class="testoFooter" href="info.jsp">INFO</a> <%-- Info --%>
                    </li>
                    <li class="oggettoListaFooter">
                        <a class="testoFooter" href="contatti.jsp">CONTATTI</a> <%-- Contatti --%>
                    </li>
                </ul>
            </div>


            <div> <%-- Div della sezione Amministratore--%>
                <%Cliente cliente = (Cliente) session.getAttribute("utente");%> <%-- Prende l'utente dalla sessione --%>
                <%if (cliente != null && cliente.isAdmin()) {%>  <%-- Controllo stato admin, in caso positivo visualizza gli elementi interni, sennò lascia il div vuoto --%>
                <h6 class="footerTitolo">FUNZIONI ADMIN</h6>
                <ul class="listaFooter">
                    <li>
                        <a class="testoFooter" href="mostraUtenti.jsp">MOSTRA UTENTI</a> <%-- Mostra utenti --%>
                    </li>
                    <li>
                        <a class="testoFooter" href="aggiungiProdotto.jsp">AGGIUNGI PRODOTTO</a> <%-- Aggiungi prodotto --%>
                    </li>
                </ul>
                <%}%>
            </div>
        </div>

        <hr class="footerLinea"/>

        <div class="footerBottom">
            <span class="copyright">&copy; 2023 AmongUs Company. All rights reserved.</span>
        </div>
    </div>
</div>

</body>

</html>
