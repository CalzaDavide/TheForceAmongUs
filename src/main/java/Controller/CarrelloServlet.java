package Controller;

import Model.CarrelloDAO;
import Model.Cliente;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/aggiungi-carrello")
public class CarrelloServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String emailUtente = ((Cliente) req.getSession().getAttribute("utente")).getEmail();
        int idProdotto = Integer.parseInt(req.getParameter("prodotto"));

        CarrelloDAO carrelloDAO = new CarrelloDAO();
        carrelloDAO.doSave(emailUtente, idProdotto);
    }
}
