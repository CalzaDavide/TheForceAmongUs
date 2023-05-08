package Controller;

import Model.Cliente;
import Model.ClienteDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;


@WebServlet("/login")
public class LogInServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ClienteDAO cd = new ClienteDAO();
        HttpSession sessioneAttuale = request.getSession();

        String email = request.getParameter("email");
        String pswd = request.getParameter("pswd");
        Cliente utente = cd.doRetrieveByEmail(email);

        String address;
        boolean logInStatus;

        HttpSession session;

        if (utente != null && utente.getPswd().equals(pswd)) {
            session = request.getSession();
            address = "index.jsp";
            session.setAttribute("utente", utente);

        } else {
            session = request.getSession();
            address = "accesso.jsp";
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(address);
        dispatcher.forward(request, response);
    }
}