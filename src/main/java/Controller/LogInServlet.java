package Controller;

import Model.Cliente;
import Model.ClienteDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;


@WebServlet("/login")
public class LogInServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ClienteDAO cd = new ClienteDAO();
        HttpSession sessioneAttuale = request.getSession();

        String email = request.getParameter("email");
        String pswd = request.getParameter("pswd");
        Cliente utente = cd.doRetrieveByEmail(email);

        String address;
        String logInStatus;


        if (utente != null && utente.getPswd().equals(pswd)) {
            address = "index.jsp";
            sessioneAttuale.setAttribute("utente", utente);
            logInStatus = "accesso";

        } else {
            address = "accesso.jsp";
            logInStatus = "errato";
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(address);
        sessioneAttuale.setAttribute("logInStatus", logInStatus);
        dispatcher.forward(request, response);
    }
}