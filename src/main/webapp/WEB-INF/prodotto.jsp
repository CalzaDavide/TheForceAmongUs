<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head><title>Yeees</title>
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

        prodotto.setCosto(Double.parseDouble(req.getParameter("costo")));
        prodotto.setEspansione(req.getParameter("espansione"));

        <label for="id_prodotto">Nome:</label><br>
        <input type="number" id="id_prodotto" name="id_prodotto" value="0"><br><br>

        <label for="nome">Cognome:</label><br>
        <input type="text" id="nome" name="nome" value="pacchetto"><br><br>

        <label for="quantita">Quantità:</label><br>
        <input type="number" id="quantita" name="quantita" value="12"><br><br>

        <label for="percentuale_sconto">percentuale sconto:</label><br>
        <input type="number" id="percentuale_sconto" name="percentuale_sconto" value="15"><br><br>

        <label for="costo">Saldo:</label><br>
        <input type="number" id="costo" name="costo" value="10"><br><br>

        <label for="espansione">espansione:</label><br>
        <input type="text" id="espansione" name="espansione" value="yees"><br><br>

        <input type="submit" value="aggiungi prodotto">
    </form>
</fieldset>

</body>
</html>
