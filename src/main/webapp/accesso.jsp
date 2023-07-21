<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>

<html>
<head>
    <title>Log-in</title>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
    <link rel="stylesheet" href="css/CssComune.css">
    <link rel="stylesheet" href="css/AccessoRegistrazioneStyle.css">
</head>

<body>
<script>
    function validate(){
        if(/[^\s@]+@[^\s@]+\.[^\s@]+/.test($("#email").val()) == false)
        {
            alert("Email non valida!");
            return false;
        }else{
            return true;
        }
    }
</script>

<div class="login">
    <% String logInStatus = (String) request.getAttribute("logInStatus");
        if (logInStatus != null && logInStatus.equals("errato")) {%>
    <h1>Credenziali Errate</h1><%}%>
    <br/>

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


</body>
</html>