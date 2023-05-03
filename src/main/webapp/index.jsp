<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head><title>Yeees</title>
</head>
<body>
<table class="title">
  <tr><th>Yeees</th></tr>
</table>
<br/>
<fieldset>
  <legend>Registrazione</legend>

  <form action="aggiungi-cliente">

    <label for="nome">Nome:</label><br>
    <input type="text" id="nome" name="nome" value="John"><br><br>

    <label for="cognome">Cognome:</label><br>
    <input type="text" id="cognome" name="cognome" value="Doe"><br><br>

    <label for="pswd">Password:</label><br>
    <input type="text" id="pswd" name="pswd" value="pswd"><br><br>

    <label for="email">E-mail:</label><br>
    <input type="email" id="email" name="email" value="John@doe.com"><br><br>

    <label for="saldo">Saldo:</label><br>
    <input type="number" id="saldo" name="saldo" value="10000"><br><br>

    <label for="indirizzo_via">Indirizzo:</label><br>
    <input type="text" id="indirizzo_via" name="indirizzo_via" value="Via dal culo"><br><br>

    <label for="codice_postale">Codice Postale:</label><br>
    <input type="number" id="codice_postale" name="codice_postale" value="34123"><br><br>

    <label for="numero_civico">Numero Civico:</label><br>
    <input type="number" id="numero_civico" name="numero_civico" value="34"><br><br>


    <input type="submit" value="aggiungi cliente">
  </form>
</fieldset>

</body></html>
