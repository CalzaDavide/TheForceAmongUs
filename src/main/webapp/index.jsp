<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="it">

<head>
    <title>Home Page </title>
    <link rel="icon"       type="image/x-icon" href="images/Icona.ico">
    <link rel="stylesheet" type="text/css"     href="css/cssComune.css">
    <link rel="stylesheet" type="text/css"     href="css/index.css"/>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script>
        <%-- Ultima espansione --%>
        // Ottieni il riferimento al form e al pulsante personalizzato
        const ultimaEspansione = document.getElementById('ultimaEspansione');
        const customMostraProdottiForm = document.getElementById('mostraAcquistiFormButton');

        // Aggiungi un gestore di eventi al clic sul pulsante personalizzato
        customMostraProdottiForm.addEventListener('click', function () {
            // Invia il modulo quando il pulsante personalizzato viene cliccato
            ultimaEspansione.submit();
        });
    </script>
</head>


<body>

<header >
    <jsp:include page="header.jsp" />
</header>

<main>

    <div id="ultimaEspansione">
        <h1>SCOPRI L'ULTIMA ESPANSIONE ESPANSIONE:</h1>
        <form action="mostra-prodotti" id="mostraProdottiForm">
            <input type="hidden" name="espansione" value="The rise of the impostor">
            <button id="mostraProdottiFormButton">
                <img src="images/ultimaEspansione.jpg" alt="ULTIMA ESPANSIONE">
            </button>
        </form>
    </div>

</main>


<footer >
    <jsp:include page="footer.jsp" />
</footer>


</body>
</html>
