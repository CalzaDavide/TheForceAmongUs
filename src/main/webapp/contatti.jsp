<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contatti</title>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
    <link rel="stylesheet" href="css/CssComune.css">
    <link rel="stylesheet" type="text/css" href="./css/homepage.css"/>
    <link rel="stylesheet" type="text/css" href="./css/footer.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script>
        // Ottieni riferenza al form dal DOM
        const emailForm = document.getElementById('emailForm');

        // Aggiungi un gestore di eventi al form
        emailForm.addEventListener('submit', (event) => {
            // Ottieni il contenuto della textarea
            const messageContent = encodeURIComponent(document.getElementById('message').value);

            // Aggiorna l'azione del form con il testo del messaggio
            emailForm.action = "mailto:david67calza@gmail.com?body=${messageContent}";
        });
    </script>
</head>
<body>
<main>
    <div class="contatti">
        <a href="index.jsp">
            <img src="images/LogoSito.jpg" alt="Logo" class="logo">
        </a>



            <h2>Descrivi il problema</h2>
            <form id="emailForm" action="mailto:david67calza@gmail.com" method="post" enctype="text/plain">
                <textarea name="message" id="message"></textarea>
                <button type="submit">Invia email</button>
            </form>





        Per qualsiasi problema o dubbio, potete contattare i creatori del sito tramite le seguenti email:<br>
        Davide.calza.2002@gmail.com<br>
        Alele.caturano.2002@gmail.com

    </div>












    Per qualsiasi problema o dubbio, potete contattare gli admin tramite le seguenti email:<br>
    Davide.calza.2002@gmail.com<br>
    Alele.caturano.2002@gmail.com
</main>

<footer>
    <jsp:include page="footer.jsp"/>
</footer>

</body>
</html>
