package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Model.*;


import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/mostra-utenti")
public class MostraUtentiServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ArrayList<Cliente> clienti;

        ClienteDAO  cd = new ClienteDAO();

        String address = "mostraUtenti.jsp";

        RequestDispatcher rd;

        clienti = cd.doRetrieveAll();

        request.setAttribute("clienti", clienti);

        rd = request.getRequestDispatcher(address);

        rd.forward(request, response);
    }
}
