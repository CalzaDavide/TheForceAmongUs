package Controller;

import Model.ClienteDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import Model.*;


import java.io.IOException;

@WebServlet(name = "AggiungiClienteServlet", value = "/aggiungi-cliente")
public class RegistrazioneServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // reading parameters from the request
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String Pswd = request.getParameter("pswd");
        String email = request.getParameter("email");
        String indirizzo_via = request.getParameter("indirizzo_via");
        String codice_postale = request.getParameter("codice_postale");
        String n_civico = request.getParameter("numero_civico");

        // instantiating the javabean to be given in input to doSave
        Cliente cliente = new Cliente();
        ClienteDAO cd = new ClienteDAO();

        Pattern nomePattern = Pattern.compile("[a-zA-Z\\s]+");
        Matcher nomeMatcher = nomePattern.matcher(nome);
        Matcher cognomeMatcher = nomePattern.matcher(cognome);
        Pattern emailPattern = Pattern.compile("[^\\s@]+@[^\\s@]+\\.[^\\s@]+");
        Matcher matcher = emailPattern.matcher(email);
        Pattern numeroPattern = Pattern.compile("[0-9]+");
        Matcher civicoMatcher = numeroPattern.matcher(n_civico);
        Matcher capMatcher = numeroPattern.matcher(codice_postale);

        cliente.setNome(nome);
        cliente.setCognome(cognome);
        cliente.setPswd(Pswd);
        cliente.setEmail(email);
        cliente.setSaldo(0);
        cliente.setIndirizzo_Via(indirizzo_via);
        cliente.setCodice_Postale(Integer.parseInt(codice_postale));
        cliente.setN_Civico(Integer.parseInt(n_civico));
        cliente.setAdminValue(false);


        // instantiating a Model class to interact with the db
        ClienteDAO service = new ClienteDAO();

        // invocating the Model service to store the "customer" in the db
        service.doSave(cliente);

        //storing the javabean in the "request" object
        request.setAttribute("cliente", cliente);
        request.getSession().setAttribute("email", email);


        RequestDispatcher dispatcher =
                request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
