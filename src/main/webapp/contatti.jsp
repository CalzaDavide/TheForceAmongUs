<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Contatti</title>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
    <link rel="stylesheet" href="css/CssComune.css">
    <link rel="stylesheet" type="text/css" href="./css/homepage.css"/>
    <link rel="stylesheet" type="text/css" href="./css/footer.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<main>
    <div class="contatti">
        <div class="form">

            <a href="index.jsp">
                <img src="images/LogoSito.jpg" alt="Logo" class="logo">
            </a>
            <form action="login" method="post" onsubmit="return validate()">
                <input required id="email" type="email" name="email" placeholder="Email" value="John@john.com"><br><br>
                <input required type="password" name="pswd" placeholder="Password" value="pswd"><br><br>
                <button>login</button>
                <p class="message">NON HAI UN ACCOUNT? <a href="registrazione.jsp">REGISTRATI</a></p>
            </form>
        </div>
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
