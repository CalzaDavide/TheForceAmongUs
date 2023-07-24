<%@ page import="Model.Prodotto" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Cliente" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Mostra prodotti</title>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
    <link rel="stylesheet" href="css/cssComune.css">
    <link rel="stylesheet" type="text/css" href="css/mostraProdotti.css"/>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script>
        function aggiungiCarrello(idProdotto){
            $.post("aggiungi-carrello",
                {prodotto: idProdotto},
            )
        }
    </script>
</head>

<body>
<%Cliente utente = (Cliente) session.getAttribute("utente");%>


<%ArrayList<Prodotto> prodotti = (ArrayList<Prodotto>) request.getAttribute("prodotti");%>

<header>
    <jsp:include page="header.jsp" />
</header>

<main>

    <div class="prodotti">
        <div class="displayProdotti">
            <%if(!prodotti.isEmpty()){
                for (Prodotto p : prodotti) {%>
                <div class="prodottoSingolo">

                <div id="immagine">
                    <img src="<%=p.getImmagine()%>" alt="foto del prodotto <%=p.getNome()%>">
                </div>

                <div class="infoProdotto">
                    <div class="prodottoHeader">
                        <h2 id="nome"><%=p.getNome().toUpperCase()%></h2>
                        <p id="espansione"><%=p.getEspansione().toUpperCase()%></p>
                    </div>

                    <div class="prodottoFooter">
                        <p id="prezzo"><%if(p.getPercentuale_sconto()==0){%>
                            <%=p.getCosto()%>
                            <%}else{%>
                            <del><%=p.getCosto()%>€</del>
                            <%=p.getPrezzoScontato()%>
                            <%}%>€</p>
                        <div id="carrello">
                            <img onclick="aggiungiCarrello(<%=p.getId()%>)" src="images/iconaCarrello.png" alt="carrello">
                        </div>
                    </div>

                </div>
                <br>
                </div>
                <hr class="footerLinea" />
                <%}
            }else{%>
            <p id="nessunRisultato">Nessun risultato relativo alla ricerca &nbsp; </p>
            <p id="ricerca"><%=request.getAttribute("ricerca")%></p>
            <%}%>
        </div>

    </div>

</main>

<footer >
    <jsp:include page="footer.jsp" />
</footer>

</body>
</html>