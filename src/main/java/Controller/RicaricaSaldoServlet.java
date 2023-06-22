package Controller;

import Model.Cliente;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "RicaricaSaldo", value = "/ricarica-saldo")
public class RicaricaSaldoServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sessione = request.getSession();

        Cliente c = (Cliente) sessione.getAttribute("utente");

        double ricaricaSaldo = Double.parseDouble(request.getParameter("ricarica"));

        c.setSaldo(c.getSaldo() + ricaricaSaldo);



        RequestDispatcher dispatcher = request.getRequestDispatcher("mostraProfilo.jsp");
        dispatcher.forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
