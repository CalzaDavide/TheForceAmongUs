package Controller;

import Model.ClienteDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import Model.*;


import java.io.IOException;

@WebServlet(name = "RegistrazioneServlet", value = "/registrazione")
public class RegistrazioneServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // reading parameters from the request
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");

        String Pswd = request.getParameter("pswd");
        String email = request.getParameter("email");

        ClienteDAO dao = new ClienteDAO();

        //Se l'email inserita è già in uso, si viene reindirizzati nuovamente alla
        //schermata di registrazione, con un messaggio di avvertenza
        if(dao.doRetrieveByEmail(email) != null){
            request.setAttribute("status", "emailInUso");
            RequestDispatcher dispatcher =
                    request.getRequestDispatcher("registrazione.jsp");
            dispatcher.forward(request, response);
        }

        String regione = request.getParameter("regione");
        String provincia = request.getParameter("provincia");
        String indirizzo_via = request.getParameter("indirizzo_via");
        String codice_postale = request.getParameter("codice_postale");
        String n_civico = request.getParameter("numero_civico");

        // instantiating the javabean to be given in input to doSave
        Cliente cliente = new Cliente();

        //Controlli lato server sui parametri inseriti
        Pattern nomePattern = Pattern.compile("[a-zA-Z\\s]+");
        Matcher nomeMatcher = nomePattern.matcher(nome);
        Matcher cognomeMatcher = nomePattern.matcher(cognome);
        Pattern emailPattern = Pattern.compile("[^\\s@]+@[^\\s@]+\\.[^\\s@]+");
        Matcher emailMatcher = emailPattern.matcher(email);
        Pattern civicoPattern = Pattern.compile("^[0-9]+$");
        Matcher civicoMatcher = civicoPattern.matcher(n_civico);
        Pattern capPattern = Pattern.compile("^[0-9]{5,6}$");
        Matcher capMatcher = capPattern.matcher(codice_postale);

        if(!nomeMatcher.find()
                || !cognomeMatcher.find()
                || !emailMatcher.find()
                || !civicoMatcher.find()
                || !capMatcher.find()
                || regione.equals("")
                || provincia.equals("")
                || provincia == null)
        {
        //Se uno dei parametri è errato, si viene reindirizzati nuovamente alla
        //schermata di registrazione, con un messaggio di errore
            request.setAttribute("status", "errore");
            RequestDispatcher dispatcher =
                    request.getRequestDispatcher("registrazione.jsp");
            dispatcher.forward(request, response);
        }

        cliente.setNome(nome);
        cliente.setCognome(cognome);
        cliente.setPswd(Pswd);
        cliente.setEmail(email);
        cliente.setRegione(regione);
        cliente.setProvincia(provincia);
        cliente.setIndirizzo_Via(indirizzo_via);
        cliente.setCodice_Postale(Integer.parseInt(codice_postale));
        cliente.setN_Civico(Integer.parseInt(n_civico));
        cliente.setAdminValue(false);

        ClienteDAO clienteDAO = new ClienteDAO();
        clienteDAO.doSave(cliente);

        //Se esisteva un carrello provvisorio nella sessione, viene salvato come carrello
        //dell'utente appena registrato
        ArrayList<OggettoQuantita> carrelloProvvisorio =(ArrayList<OggettoQuantita>) request.getSession().getAttribute("carrelloProvvisorio");
        if(carrelloProvvisorio != null)
        {
            CarrelloDAO carrelloDAO = new CarrelloDAO();
            carrelloDAO.doSave(email, carrelloProvvisorio);
            request.getSession().removeAttribute("carrelloProvvisorio");
        }

        RequestDispatcher dispatcher =
                request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
