package Controller;

import Model.CarrelloDAO;
import Model.Cliente;
import Model.OggettoQuantita;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/rimuovi-carrello")
public class RimuoviCarrelloServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cliente utente =(Cliente)req.getSession().getAttribute("utente");
        int prodotto = Integer.parseInt(req.getParameter("prodotto"));
        if(utente != null)
        {
            String email = utente.getEmail();
            CarrelloDAO carrelloDAO = new CarrelloDAO();
            carrelloDAO.doDeleteByIdProdotto(email, prodotto);
        }else{
            ArrayList<OggettoQuantita> carrelloProvvisorio = (ArrayList<OggettoQuantita>)req.getSession().getAttribute("carrelloProvvisorio");
            int i = 0;
            for(OggettoQuantita oq : carrelloProvvisorio){
                if(oq.getProdotto().getId() == prodotto)
                    {
                        carrelloProvvisorio.remove(i);
                        req.getSession().setAttribute("carrelloProvvisorio", carrelloProvvisorio);
                    }
                i++;
            }
        }
    }
}
