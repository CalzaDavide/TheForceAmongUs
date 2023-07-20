package Controller;

import Model.CarrelloDAO;
import Model.Cliente;
import Model.OggettoQuantita;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/mostra-carrello")
public class MostraCarrelloServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cliente utente =(Cliente)req.getSession().getAttribute("utente");
        ArrayList<OggettoQuantita> carrello;
        if(utente != null) {
            String email = utente.getEmail();
            CarrelloDAO carrelloDAO = new CarrelloDAO();
            carrello = carrelloDAO.doRetriveByCliente(email);
        }else{
            carrello=(ArrayList<OggettoQuantita>)req.getSession().getAttribute("carrelloProvvisorio");
            if(carrello==null)
                carrello= new ArrayList<>();
        }
        req.setAttribute("carrello", carrello);
        float totale = 0;
        for(OggettoQuantita oq : carrello){
            double costo=oq.getProdotto().getCosto();
            totale += oq.getProdotto().getPrezzoScontato() * oq.getQuantita();
        }
        req.setAttribute("totale", totale);

        RequestDispatcher dispatcher = req.getRequestDispatcher("carrello.jsp");
        dispatcher.forward(req, resp);
    }
}
