<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head><title>Registrazione</title>
    <link rel="icon" type="image/x-icon" href="images/Icona.ico">
    <link rel="stylesheet" href="css/AccessoRegistrazioneStyle.css">
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
    function validate(){
        if(
            /^[^\s@]+@[^\s@]+\.[^\s@]+/.test($("#email").val()) == false
            || /[^a-z]+/i.test($("#fname").val())
            || /[^a-z]+/i.test($("#lname").val())
            || /[^0-9]+/.test($("#civico").val())
            || /\d{5,6}]/.test($("#cap").val()) == false
        ){
            $("#errore").style.visibility="visible"
            return false;
        }else{
            return true;
        }
    }

    function trovaProvince(){
        var regione = document.getElementById("regione").value;
        var xhr = new XMLHttpRequest();
        xhr.open("post", "data\\regioni.json", true);
        xhr.onreadystatechange = function (){
            if(this.readyState == 4 && this.status == 200){
                var risultato =JSON.parse(this.responseText);
                var selettoreProvincia = document.getElementById("provincia");
                for(var i = 0; i < 20; i++){
                    if(risultato.regioni[i].nome == regione){
                        selettoreProvincia.removeAttribute("disabled");
                        var province = risultato.regioni[i].province;
                        for(var j = 0; j < province.lenght; j++)
                            selettoreProvincia.appendChild("<option value=+ province[j] +>" + province[j] + "</option>");
                        break;
                    }
                }
            }
        }
        xhr.send("regione="+regione);
    }
</script>
<br/>

<div class="registrazione">

    <% String status = (String)request.getAttribute("status");
        if(status != null && status.equals("emailInUso")){%>
        <h1>Email già in uso.</h1>
    <%}%>

    <div class="form">
        <a href="index.jsp">
            <img src="images/LogoSito.jpg" alt="Logo" class="logo">
        </a>

        <form action="aggiungi-cliente" onsubmit="return validate()" id="clienteForm">

            <input required id="email" type="email" name="email" placeholder="Email"><br><br>
            <input required type="password" name="pswd" placeholder="Password"><br><br>

            <input required id="fname" type="text" name="nome" placeholder="Nome"><br><br>
            <input required id="lname" type="text" name="cognome" placeholder="Cognome"><br><br>

            <select id="regione" onchange="trovaProvince()" form="clienteForm">
                <option value="" selected>Seleziona una regione</option>
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

            <input required id= type="text" name="indirizzo_via" placeholder="Indirizzo"><br><br>
            <input required id="civico" type="number" name="numero_civico" placeholder="Numero Civico"><br><br>
            <input required id="cap" type="number" name="codice_postale" placeholder="Cap"><br><br>

            <button>Registrati</button>
            <p class="message">Hai gia' un account? <a href="accesso.jsp">Accedi</a></p>
        </form>
    </div>
</div>

</body>
</html>
