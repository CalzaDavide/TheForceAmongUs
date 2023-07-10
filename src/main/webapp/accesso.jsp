<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>

<html>
<head>
    <title>Log-in</title>
    <link rel="icon" type="image/x-icon" href="images/Logo.ico">
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
        <form action="login" method="post" onsubmit="return validate()">
            <input required id="email" type="email" name="email" placeholder="Email"><br><br>
            <input required type="password" name="pswd" placeholder="Password"><br><br>
            <button>login</button>
            <p class="message">Non hai un account? <a href="registrazione.jsp">Registrati</a></p>
        </form>
    </div>
</div>

</body>
</html>