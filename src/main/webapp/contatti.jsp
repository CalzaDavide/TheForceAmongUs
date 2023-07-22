<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contatti</title>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
    <link rel="stylesheet" href="css/CssComune.css">
    <link rel="stylesheet" href="css/infoContatti.css">
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

    <div class="contenitoreInfoContatti">
        <div class="contatti">
            <a href="index.jsp">
                <img src="images/LogoSito.jpg" alt="Logo" class="logo">
            </a>
            <h1>Descrivi il problema</h1>
            <form id="emailForm" action="mailto:david67calza@gmail.com" method="post" enctype="text/plain">
                <textarea name="message" id="message" rows="10" cols="60"></textarea>
                <button type="submit">Invia email</button>
            </form>
        </div>
    </div>

</main>

<footer>
    <jsp:include page="footer.jsp"/>
</footer>

</body>
</html>
