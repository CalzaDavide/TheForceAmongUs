<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head><title>Registrazione</title>
    <link rel="stylesheet" href="./css/RegistrazioneStyle.css">
</head>
<body>
<br/>

<div class="registrazione">
    <div class="form">
        <form action="aggiungi-cliente">


            <input required type="email" name="email" placeholder="Email"><br><br>
            <input required type="password" name="pswd" placeholder="Password"><br><br>

            <input required type="text" name="nome" placeholder="Nome"><br><br>
            <input required type="text" name="cognome" placeholder="Cognome"><br><br>

            <input required type="text" placeholder="Indirizzo"><br><br>
            <input required type="number" name="numero_civico" placeholder="Numero Civico"><br><br>
            <input required type="number" name="codice_postale" placeholder="Cap"><br><br>


            <button>Registrati</button>
            <p class="message">Hai già un account? <a href="accesso.jsp">Accedi</a></p>
        </form>
    </div>
</div>

</body>
</html>
