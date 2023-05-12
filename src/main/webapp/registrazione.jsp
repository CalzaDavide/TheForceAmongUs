<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head><title>Registrazione</title>
</head>
<body>
<br/>


<form action="aggiungi-cliente">
    <fieldset>
        <legend>Dati utente</legend>

        <label for="email">E-mail:</label><br>
        <input required type="email" id="email" name="email" value="Mario.Rossi@gmail.com"><br><br>

        <label for="pswd">Password:</label><br>
        <input required type="text" id="pswd" name="pswd" value="pswd"><br><br>

    </fieldset>

    <fieldset>
        <legend>Dati Spedizione</legend>
        <label for="nome">Nome:</label><br>
        <input required type="text" id="nome" name="nome" value="Mario"><br><br>

        <label for="cognome">Cognome:</label><br>
        <input required type="text" id="cognome" name="cognome" value="Rossi"><br><br>

        <label for="saldo">Saldo:</label><br>
        <input required type="number" id="saldo" name="saldo" value="1000"><br><br>

        <label for="indirizzo_via">Indirizzo:</label><br>
        <input required type="text" id="indirizzo_via" name="indirizzo_via" value="Via Diego Armando Maradona"><br><br>

        <label for="codice_postale">Codice Postale:</label><br>
        <input required type="number" id="codice_postale" name="codice_postale" value="34123"><br><br>

        <label for="numero_civico">Numero Civico:</label><br>
        <input required type="number" id="numero_civico" name="numero_civico" value="69"><br><br>

        <input type="submit" value="aggiungi cliente" >
    </fieldset>
</form>
<a href="index.jsp">Home page</a>

</body>
</html>
