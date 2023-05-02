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

@WebServlet(name = "AddCustomerServlet", value = "/add-customer")
public class AddCustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // reading parameters from the request
        String cognome = request.getParameter("cognome");
        String nome = request.getParameter("nome");
        double saldo = Double.parseDouble(request.getParameter("saldo"));

        // instantiating the javabean to be given in input to doSave
        Cliente cliente = new Cliente();
        cliente.setNome(nome);
        cliente.setCognome(cognome);
        cliente.setSaldo(saldo);

        // instantiating a Model class to interact with the db
        ClienteDAO service = new ClienteDAO();

        // invocating the Model service to store the "customer" in the db
        service.doSave(cliente);

        //storing the javabean in the "request" object
        request.setAttribute("customer", cliente);


        RequestDispatcher dispatcher =
                request.getRequestDispatcher("WEB-INF/results/db-insert-success.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
