package Controller;

import Model.Acquisto;
import Model.CarrelloDAO;
import Model.OggettoQuantita;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.swing.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/acquisto")
public class AcquistoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CarrelloDAO carrelloDAO = new CarrelloDAO();
        int utente = Integer.parseInt(req.getParameter("utente"));

        CoinvolgimentoDAO  coinvolgimentoDAO = new CoinvolgimentoDAO();
        AcquistoDAO acquistoDAO = new AcquistoDAO();

        acquistoDAO.doSave(id, data, importo, cliente);
        ArrayList<OggettoQuantita> prodotti = new ArrayList<>();
        for(OggettoQuantita oq : prodotti){
            coinvolgimentoDAO.doSave(oq.getQuantita(), oq.getProdotto(), acquisto.getIdOrdine());
        }

        carrelloDAO.doDeleteByIdCliente(utente);
    }
}
