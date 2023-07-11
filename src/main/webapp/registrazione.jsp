<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head><title>Registrazione</title>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
    <link rel="stylesheet" href="css/AccessoRegistrazioneStyle.css">
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
    function validate(){
        if(
            /^[^\s@]+@[^\s@]+\.[^\s@]+/.test($("#email").val()) == false
            || /[^a-z]+/i.test($("#fname").val())
            || /[^a-z]+/i.test($("#lname").val())
            || /[^0-9]+/.test($("#civico").val())
            || /[^0-9/\d{5,6}]+/.test($("#cap").val())
        ){
            $("#errore").style.visibility="visible"
            return false;
        }else{
            return true;
        }
    }
</script>
<br/>

<div class="registrazione">

    <% String status = (String)request.getAttribute("status");
        if(status != null && status.equals("emailInUso")){%>
        <h1>Email già in uso.</h1>
    <%}%>
    <h1 style="visibility: hidden" id="errore">Credenziali non valide.</h1>
    <div class="form">
        <a href="index.jsp">
            <img src="images/LogoSito.jpg" alt="Logo" class="logo">
        </a>

        <form action="aggiungi-cliente" onsubmit="return validate()">

            <input required id="email" type="email" name="email" placeholder="Email"><br><br>
            <input required type="password" name="pswd" placeholder="Password"><br><br>

            <input required id="fname" type="text" name="nome" placeholder="Nome"><br><br>
            <input required id="lname" type="text" name="cognome" placeholder="Cognome"><br><br>

            <input required id= type="text" name="indirizzo_via" placeholder="Indirizzo"><br><br>
            <input required id="civico" type="number" name="numero_civico" placeholder="Numero Civico"><br><br>
            <input required id="cap" type="number" name="codice_postale" placeholder="Cap"><br><br>


            <button>Registrati</button>
            <p class="message">Hai già un account? <a href="accesso.jsp">Accedi</a></p>
        </form>
    </div>
</div>

</body>
</html>
