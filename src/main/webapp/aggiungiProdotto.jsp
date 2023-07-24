<%@ page import="Model.Cliente" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Aggiungi Prodotto</title>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
    <link rel="stylesheet" href="css/cssComune.css">
    <link rel="stylesheet" href="css/aggiungiProdotto.css">
</head>

<body>
    <!-- Se si accede a questa pagina senza privilegi da amministratore, si è
     reindirizzati alla homepage-->
    <% Cliente utente = (Cliente)session.getAttribute("utente");
        if(utente==null || !utente.isAdmin()){%>
    <jsp:forward page="index.jsp"></jsp:forward>
    <%}%>
    <main>

    <div id="aggiungiProdotto">

        <!-- Avviene prima l'upload dell'immagine -->
        <%String immagine =(String) request.getAttribute("uploaded");
            if(immagine == null){%>

        <form action="Upload" method="post" enctype="multipart/form-data">
            <input type="file" name="file" /><br>
            <button type="submit">INVIA</button>
        </form>

        <!-- Dopodichè si inseriscono gli altri parametri relativi al nuovo prodotto -->
            <%}else{%>
        <form action="aggiungi-prodotto">

            <label for="nome">NOME:</label><br>
            <input required type="text" id="nome" name="nome" placeholder="Marco"><br><br>

            <label for="percentuale_sconto">PERCENTUALE SCONTO:</label><br>
            <input required type="number" id="percentuale_sconto" name="percentuale_sconto" placeholder="5"><br><br>

            <label for="costo">COSTO:</label><br>
            <input required type="number" id="costo" name="costo" placeholder="10"><br><br>

            <label for="espansione">ESPANSIONE:</label><br>
            <select id="espansione" name="espansione">
                <option value="Set Base">SET BASE</option>
                <option value="The rise of the impostor">THE RISE OF THE IMPOSTOR</option>
            </select><br><br>

            <label for="tipologia">TIPOLOGIA:</label><br>
            <select id="tipologia" name="tipologia">
                <option value="Carta">CARTA</option>
                <option value="Pacchetto">PACCHETTO</option>
                <option value="Box">BOX</option>
            </select>

            <input type="hidden" name="immagine" value="<%=immagine%>">

            <button type="submit">AGGIUNGI PRODOTTO</button>

        </form>
        <%}%>

    </div>



</main>
</body>
</html>
