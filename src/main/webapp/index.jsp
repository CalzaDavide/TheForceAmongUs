<%@ page import="Model.Cliente" %>
<%@ page import="com.mysql.cj.Session" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

    <title>Home Page </title>
    <link rel="icon" type="image/x-icon" href="images/Logo.ico">
    <link rel="stylesheet" href="css/homepage.css" type="text/css">
</head>

<body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<header class="row">
    <form action="mostra-prodotti" id="searchbar" class="col-md-6">
        <input type="submit" value="CERCA">
        <input type="text" width="200px" name="ricerca">
    </form>
    <div id="account" class="col-md-6">
        <%
        Cliente cliente = (Cliente) session.getAttribute("utente");
        if (cliente == null){
        %>
            <a href="accesso.jsp"  class="col-md-3"><input type="button" value="Accedi"></a>
            <a href="registrazione.jsp" class="col-md-3"><input type="button" value="Registrati"></a>
            <%} else {%>
            <div class="row">
                <h1 class="col">Benvenuto, <%= cliente.getNome()%>!</h1>
                <form action="logout" class="col">
                    <input type="submit" value="Log out">
                </form>
                <form action="mostra-carrello" class="col">
                    <input type="hidden" name="idUtente" value=<%=cliente.getId()%>>
                    <input type="submit" value="Carrello">
                </form>
            </div>
        <%}%>
    </div>
</header>
    <br>
    <% if(cliente != null && cliente.isAdmin()){%>
        <form action="mostra-utenti">
            <input type=submit value="Mostra Utenti">
        </form>
        <a href="prodotto.jsp">aggiungi prodotto</a><br>
    <%}%>

<br>
<h2>sasa</h2><br>
<h2>sasa</h2><br>
<h2>sasa</h2><br>
<h2>sasa</h2><br>
<h2>sasa</h2><br>
<h2>sasa</h2><br>
<h2>sasa</h2><br>
<h2>sasa</h2><br>
<h2>sasa</h2><br>
<h2>sasa</h2><br>
<h2>sasa</h2><br>
<h2>sasa</h2><br>
<h2>sasa</h2><br>
<h2>sasa</h2><br>
<h2>sasa</h2><br>


</body>
</html>
