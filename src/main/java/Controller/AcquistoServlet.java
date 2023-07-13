package Controller;

import Model.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

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
        String utente = ((Cliente)req.getSession().getAttribute("utente")).getEmail();

        CoinvolgimentoDAO coinvolgimentoDAO = new CoinvolgimentoDAO();
        AcquistoDAO acquistoDAO = new AcquistoDAO();

        Acquisto acquisto = new Acquisto();
        acquisto.setId(Acquisto.generateId());
        java.util.Date utilDate = new java.util.Date();
        acquisto.setData(new java.sql.Date(utilDate.getTime()));
        ArrayList<OggettoQuantita> carrello = carrelloDAO.doRetriveByCliente(utente);
        float totale = 0f;
        for(OggettoQuantita oq : carrello){
            totale += oq.getQuantita() * oq.getProdotto().getPrezzoScontato();
        }
        acquisto.setImporto(totale);
        acquisto.setEmailCliente(utente);
        acquistoDAO.doSave(acquisto);

        for(OggettoQuantita oq : carrello){
            Coinvolgimento c = new Coinvolgimento();
            c.setQuantita(oq.getQuantita());
            c.setProdotto(oq.getProdotto());
            c.setIdAcquisto(acquisto.getId());
            coinvolgimentoDAO.doSave(c);
        }

        carrelloDAO.doDeleteByIdCliente(utente);
    }
}
