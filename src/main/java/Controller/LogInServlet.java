package Controller;

import Model.Cliente;
import Model.ClienteDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("login")
public class LogInServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ClienteDAO cd = new ClienteDAO();
        String email = req.getParameter("email");
        String pswd = req.getParameter("pswd");
        Cliente utente = cd.doRetrieveByEmail(email);

        HttpSession session;
        if(utente != null && utente.getPswd().equals(pswd)) {
            session = req.getSession();
            session.setAttribute("utente", utente);
            RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");
            dispatcher.forward(req, resp);
        }

    }
}
