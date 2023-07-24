package Controller;

import Model.CarrelloDAO;
import Model.Cliente;
import Model.OggettoQuantita;
import Model.ProdottoDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/aggiungi-carrello")
public class CarrelloServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cliente utente = (Cliente) req.getSession().getAttribute("utente");
        int idProdotto = Integer.parseInt(req.getParameter("prodotto"));

        //Se l'utente non ha eseguito l'accesso, utilizza un carrello provvisorio salvato nella sessione
        if(utente == null){
            //Controlla se esiste già un carrello provvisorio nella sessione, altrimenti lo crea.
            ArrayList<OggettoQuantita> carrelloProvvisorio = (ArrayList<OggettoQuantita>)req.getSession().getAttribute("carrelloProvvisorio");
            if(carrelloProvvisorio == null)
                carrelloProvvisorio = new ArrayList<>();

            //Se il prodotto da aggiungere esiste già nel carrello provvisorio ne aumenta la quantità...
            for(OggettoQuantita oq : carrelloProvvisorio)
            {
                if(oq.getProdotto().getId() == idProdotto) {
                    oq.setQuantita(oq.getQuantita() + 1);
                    req.getSession().setAttribute("carrelloProvvisorio", carrelloProvvisorio);
                    return;
                }
            }

            // ...altrimenti lo aggiunge
            OggettoQuantita oggettoQuantita = new OggettoQuantita();
            ProdottoDAO pd = new ProdottoDAO();

            oggettoQuantita.setProdotto(pd.doRetrieveById(idProdotto));
            oggettoQuantita.setQuantita(1);
            carrelloProvvisorio.add(oggettoQuantita);

            //e aggiorna la sessione con il carrello provvisorio modificato o creato
            req.getSession().setAttribute("carrelloProvvisorio", carrelloProvvisorio);

        }else{
        //Altrimenti aggiunge il prodotto al carrello direttamente nel database
            CarrelloDAO carrelloDAO = new CarrelloDAO();
            carrelloDAO.doSave(utente.getEmail(), idProdotto);
        }
    }
}
