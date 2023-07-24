<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head><title>Registrazione</title>
        <link rel="icon"       type="image/x-icon" href="images/Icona.ico">
        <link rel="stylesheet" type="text/css"     href="css/cssComune.css">
        <link rel="stylesheet" type="text/css"     href="css/accessoRegistrazione.css">

        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>

<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
    //quando la pagina è pronta, controlla che non sia avvenito un tentativo errato di registrazione.
    //se è avvenuto, visualizza il relativo messaggio di errore
    $(document).ready(function(){
        <% String status = (String)request.getAttribute("status");
        if(status != null){
            if(status.equals("errore")){%>
                $("#errore").html("Valore non valido.");
            <%}else if(status.equals("emailInUso")){%>
                $("#errore").html("Email in uso.");
            <%}
        }%>
    })

    //controlla che i campi del form siano correttamente riempiti, visualizzando un
    //messaggio di errore in caso contrario
    function validate(){
        if(!(/^[^\s@]+@[^\s@]+\.[^\s@]+/.test($("#email").val()))
            || /[^a-z]+/i.test($("#fname").val())
            || /[^a-z]+/i.test($("#lname").val())
            || /[^0-9]+/.test($("#civico").val())
            || !(/^\d{5,6}$/.test($("#cap").val()))
            || $("#regione").val()===""
            || $("#provincia").val()===null
            || $("#provincia").val()==="")
        {
            $("#errore").html("Valore non valido");
            return false;
        }
        else{
            return true;
        }
    }

    function trovaProvince(){
        $("#selezione").remove();
        $.getJSON("data\\regioni.json", function(result){
            result.regioni.forEach(function(item, index){
                if(item.nome===$("#regione").val()){
                    $("#provincia").removeAttr("disabled");
                    $("#provincia").html("");
                    $("#provincia").append('<option value="" selected>Seleziona una provincia</option>');
                    item.province.forEach(function(item, index){
                        $("#provincia").append('<option value="'+item+'">' + item + '</option>');
                    });
                }
            });
        });
    }
</script>
<br>
<h1 id="errore"></h1>

<div class="registrazione">

    <div class="form">
        <a href="index.jsp">
            <img src="images/LogoSito.jpg" alt="Logo" class="logo">
        </a>

        <form action="registrazione" method="get" onsubmit="return validate()" id="clienteForm">

            <input required id="email" type="email" name="email" placeholder="Email"><br><br>
            <input required type="password" name="pswd" placeholder="Password"><br><br>

            <input required id="fname" type="text" name="nome" placeholder="Nome"><br><br>
            <input required id="lname" type="text" name="cognome" placeholder="Cognome"><br><br>

            <select id="regione" onchange="trovaProvince()" form="clienteForm" name="regione">
                <option value="" id="selezione" selected>Seleziona una regione</option>
                <option value="Abruzzo">Abruzzo</option>
                <option value="Basilicata">Basilicata</option>
                <option value="Calabria">Calabria</option>
                <option value="Campania">Campania</option>
                <option value="Emilia-Romagna">Emilia-Romagna</option>
                <option value="Friuli-Venezia Giulia">Friuli-Venezia Giulia</option>
                <option value="Lazio">Lazio</option>
                <option value="Liguria">Liguria</option>
                <option value="Lombardia">Lombardia</option>
                <option value="Marche">Marche</option>
                <option value="Molise">Molise</option>
                <option value="Piemonte">Piemonte</option>
                <option value="Puglia">Puglia</option>
                <option value="Sardegna">Sardegna</option>
                <option value="Sicilia">Sicilia</option>
                <option value="Toscana">Toscana</option>
                <option value="Trentino-Alto Adige">Trentino-Alto Adige</option>
                <option value="Umbria">Umbria</option>
                <option value="Valle d'Aosta">Valle d'Aosta</option>
                <option value="Veneto">Veneto</option>
            </select>

            <select id="provincia" form="clienteForm" name="provincia" disabled>
            </select>

            <input required id= type="text" name="indirizzo_via" placeholder="INDIRIZZO"><br><br>
            <input required id="civico" type="number" name="numero_civico" placeholder="NUMERO CIVICO"><br><br>
            <input required id="cap" type="number" name="codice_postale" placeholder="CAP"><br><br>

            <button type="submit">REGISTRATI</button>
            <p class="message">HAI GIA' UN ACCOUNT? <a href="accesso.jsp">Accedi</a></p>
        </form>
    </div>
</div>

</body>
</html>
