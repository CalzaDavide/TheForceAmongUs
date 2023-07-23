<%@ page import="java.io.File" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <title>Aggiungi Prodotto</title>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
    <link rel="stylesheet" href="css/CssComune.css">
    <link rel="stylesheet" href="css/aggiungiProdotto.css">
</head>

<body>

<main>

    <div id="aggiungiProdotto">

        <form action="Upload" method="post" enctype="multipart/form-data">
            <input type="file" name="file" /><br>
            <button type="submit">INVIA</button>
        </form>

        <%String immagine =(String) request.getAttribute("uploaded");
            if(immagine != null){%>
        <form action="aggiungi-prodotto">

            <label for="nome">Nome:</label><br>
            <input required type="text" id="nome" name="nome" placeholder="Marco"><br><br>

            <label for="percentuale_sconto">Percentuale sconto:</label><br>
            <input required type="number" id="percentuale_sconto" name="percentuale_sconto" placeholder="5"><br><br>

            <label for="costo">Costo:</label><br>
            <input required type="number" id="costo" name="costo" placeholder="10"><br><br>


            <select id="espansione" name="espansione">
                <option value="Set Base">SET BASE</option>
                <option value="The rise of the impostor">THE RISE OF THE IMPOSTOR</option>
            </select><br><br>


            <select id="tipologia" name="tipologia">
                <option value="Carta">CARTA</option>
                <option value="Pacchetto">PACCHETTO</option>
                <option value="Box">BOX</option>
            </select><br><br>

            <input type="hidden" name="immagine" value="<%=immagine%>">

            <button type="submit">AGGIUNGI PRODOTTO</button>

        </form>
        <%}%>

    </div>



</main>


<%--%>
    <form action="Upload" method="post" enctype="multipart/form-data">
        Immagine: <input type="file" name="file" /><br>
        <input type="submit" value="Invia" />
    </form>
    <%String immagine =(String) request.getAttribute("uploaded");
    if(immagine != null){%>
    <form action="aggiungi-prodotto">

        <label for="nome">Nome:</label><br>
        <input required type="text" id="nome" name="nome" placeholder="Marco"><br><br>

        <label for="percentuale_sconto">Percentuale sconto:</label><br>
        <input required type="number" id="percentuale_sconto" name="percentuale_sconto" placeholder="5"><br><br>

        <label for="costo">Costo:</label><br>
        <input required type="number" id="costo" name="costo" placeholder="10"><br><br>


        <select id="espansione" name="espansione">
            <option value="Set Base">SET BASE</option>
            <option value="The rise of the impostor">THE RISE OF THE IMPOSTOR</option>
        </select><br><br>


        <select id="tipologia" name="tipologia">
            <option value="Carta">CARTA</option>
            <option value="Pacchetto">PACCHETTO</option>
            <option value="Box">BOX</option>
        </select><br><br>

        <input type="hidden" name="immagine" value="<%=immagine%>">

        <input type="submit" value="aggiungi prodotto">
    </form>
    <%}%>
<%--%>

</body>
</html>
