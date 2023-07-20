<%--
  Created by IntelliJ IDEA.
  User: david
  Date: 20/07/2023
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>footer</title>
  <link rel="stylesheet" href="css/CssComune.css">
  <link rel="stylesheet" type="text/css" href="./css/homepage.css"/>
  <link rel="stylesheet" type="text/css" href="./css/footer.css"/>
  <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

<footer class="footer">
  <div class="contenitoreFooter">
    <div class="footerTop">
      <div>

      </div>
      <div>
        <h6 class="footerTitolo">Prodotti</h6>
        <ul class="listaFooter">
          <li class="oggettoListaFooter">
            <form action="mostra-prodotti" class="linkListaFooter"><input type="hidden" name="ricerca" value=""><input class="submitFooter" type="submit" value="CATALOGO"></form>
          </li>
          <li class="oggettoListaFooter">
            <form action="mostra-prodotti" class="linkListaFooter"><input type="hidden" name="tipologia" value="Pacchetto"><input class="submitFooter" type="submit" value="PACCHETTI"></form>
          </li>
          <li class="oggettoListaFooter">
            <form action="mostra-prodotti" class="linkListaFooter"><input type="hidden" name="tipologia" value="Box"><input class="submitFooter" type="submit" value="BOX"></form>
          </li>
          <li class="oggettoListaFooter">
            <form action="mostra-prodotti" class="linkListaFooter"><input type="hidden" name="tipologia" value="Carta"><input class="submitFooter" type="submit" value="CARTE"></form>                    </li>
        </ul>
      </div>
      <div>
        <h6 class="footerTitolo">Altro</h6>
        <ul class="listaFooter">
          <li class="oggettoListaFooter">
            <a href="" class="linkListaFooter">About</a>
          </li>
          <li class="oggettoListaFooter">
            <a href="" class="linkListaFooter">Careers</a>
          </li>
          <li class="oggettoListaFooter">
            <a href="" class="linkListaFooter">Affiliates</a>
          </li>
          <li class="oggettoListaFooter">
            <a href="" class="linkListaFooter">Sitemap</a>
          </li>
        </ul>
      </div>
    </div>

    <hr class="footerLinea" />

    <div class="footerBottom">
      <span class="copyright">&copy; 2023 AmongUs Company. All rights reserved.</span>
    </div>
  </div>
</footer>

</body>
</html>
