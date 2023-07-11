<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Yeees</title>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
</head>
<body>
<table class="title">
    <tr>
        <th>Yeees</th>
    </tr>
</table>
<br/>
<fieldset>
    <legend>Prodotto</legend>

    <form action="aggiungi-prodotto">

        <label for="nome">Nome:</label><br>
        <input type="text" id="nome" name="nome" value="pacchetto"><br><br>

        <label for="percentuale_sconto">Percentuale sconto:</label><br>
        <input type="number" id="percentuale_sconto" name="percentuale_sconto" value="15"><br><br>

        <label for="costo">Costo:</label><br>
        <input type="number" id="costo" name="costo" value="10"><br><br>

        <label for="espansione">Espansione:</label><br>
        <input type="text" id="espansione" name="espansione" value="yees"><br><br>

        <label for="tipologia">Tipologia:</label><br>
        <input type="text" id="tipologia" name="tipologia" value="noooon"><br><br>

        <input type="submit" value="aggiungi prodotto">
    </form>
</fieldset>

</body>
</html>
