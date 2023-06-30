package Controller;

import Model.CarrelloDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/rimuovi-carrello")
public class RimuoviCarrelloServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int utente = Integer.parseInt(req.getParameter("utente"));
        int prodotto = Integer.parseInt(req.getParameter("prodotto"));

        CarrelloDAO carrelloDAO = new CarrelloDAO();
        carrelloDAO.doDeleteById(utente, prodotto);
    }
}
