package Controller;

import Model.ClienteDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import Model.*;


import java.io.IOException;

@WebServlet(name = "AggiungiClienteServlet", value = "/aggiungi-cliente")
public class AggiungiClienteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // reading parameters from the request
        String nome = request.getParameter("nome");
        String cognome = request.getParameter("cognome");
        String pswd = request.getParameter("pswd");
        String email = request.getParameter("email");
        double saldo = Double.parseDouble(request.getParameter("saldo"));
        String indirizzo_via = request.getParameter("indirizzo_via");
        int codicePostale = Integer.parseInt(request.getParameter("codice_Postale"));
        int n_Civico = Integer.parseInt(request.getParameter("numero_Civico"));

        // instantiating the javabean to be given in input to doSave
        Cliente cliente = new Cliente();
        cliente.setNome(nome);
        cliente.setCognome(cognome);
        cliente.setPswd(pswd);
        cliente.setEmail(email);
        cliente.setSaldo(saldo);
        cliente.setIndirizzo_Via(indirizzo_via);
        cliente.setCodice_Postale(codicePostale);
        cliente.setN_Civico(n_Civico);



        // instantiating a Model class to interact with the db
        ClienteDAO service = new ClienteDAO();

        // invocating the Model service to store the "customer" in the db
        service.doSave(cliente);

        //storing the javabean in the "request" object
        request.setAttribute("cliente", cliente);


        RequestDispatcher dispatcher =
                request.getRequestDispatcher("index.html");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
