package Controller;

import Model.*;
import jakarta.servlet.RequestDispatcher;
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

        //continua a generare id finchè non ne genera uno libero
        do {
            acquisto.setId(Acquisto.generateId());
        }while(acquistoDAO.doRetriveById(acquisto.getId()) != null);

        //conversione data di java a data di sql
        java.util.Date utilDate = new java.util.Date();
        acquisto.setData(new java.sql.Date(utilDate.getTime()));

        //scorre gli elementi nel carrello per calcolare il totale
        ArrayList<OggettoQuantita> carrello = carrelloDAO.doRetriveByCliente(utente);
        float totale = 0f;
        for(OggettoQuantita oq : carrello){
            totale += oq.getQuantita() * oq.getProdotto().getPrezzoScontato();
        }

        //Imposta i parametri dell'acquisto e lo salva nel database
        acquisto.setImporto(totale);
        acquisto.setEmailCliente(utente);
        acquistoDAO.doSave(acquisto);

        //crea un'entità coinvolgimento per ogni prodotto coinvolto nell'acquisto.
        // Queste entità comprendono prodotto e quantità
        for(OggettoQuantita oq : carrello){
            Coinvolgimento c = new Coinvolgimento();
            c.setQuantita(oq.getQuantita());
            c.setProdotto(oq.getProdotto());
            c.setIdAcquisto(acquisto.getId());
            coinvolgimentoDAO.doSave(c);
        }

        //Svuota il carrello e mostra una pagina di acquisto effettuato
        carrelloDAO.doDeleteByIdCliente(utente);
        RequestDispatcher dispatcher = req.getRequestDispatcher("acquistoEffettuato.jsp");
        dispatcher.forward(req, resp);
    }
}
