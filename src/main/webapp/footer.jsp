<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>footer</title>
    <link rel="stylesheet" type="text/css" href="css/CssComune.css">
    <link rel="stylesheet" type="text/css" href="./css/homepage.css"/>
    <link rel="stylesheet" type="text/css" href="./css/footer.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<div class="footer">
    <div class="contenitoreFooter">
        <div class="footerTop">
            <div>

            </div>
            <div>
                <h6 class="footerTitolo">PRODOTTI</h6>
                <ul class="listaFooter">
                    <li class="oggettoListaFooter">
                        <form action="mostra-prodotti" class="linkListaFooter">
                          <input type="hidden" name="ricerca" value="">
                          <input class="testoFooter" type="submit" value="CATALOGO"></form>
                    </li>
                    <li class="oggettoListaFooter">
                        <form action="mostra-prodotti" class="linkListaFooter">
                          <input type="hidden" name="tipologia" value="Pacchetto">
                          <input class="testoFooter" type="submit" value="PACCHETTI"></form>
                    </li>
                    <li class="oggettoListaFooter">
                        <form action="mostra-prodotti" class="linkListaFooter">
                          <input type="hidden" name="tipologia" value="Box">
                          <input class="testoFooter" type="submit" value="BOX"></form>
                    </li>
                    <li class="oggettoListaFooter">
                        <form action="mostra-prodotti" class="linkListaFooter">
                          <input type="hidden" name="tipologia" value="Carta">
                          <input class="testoFooter" type="submit" value="CARTE"></form>
                    </li>
                </ul>
            </div>
            <div>
                <h6 class="footerTitolo">ALTRO</h6>
                <ul class="listaFooter">
                    <li class="oggettoListaFooter">
                        <a href="info.jsp" class="testoFooter">INFO</a>
                    </li>
                    <li class="oggettoListaFooter">
                        <a href="contatti.jsp" class="testoFooter">CONTATTI</a>
                    </li>
                </ul>
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
