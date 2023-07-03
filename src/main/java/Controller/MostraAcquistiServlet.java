package Controller;

import Model.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/mostra-acquisti")
public class MostraAcquistiServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AcquistoDAO acquistoDAO = new AcquistoDAO();
        CoinvolgimentoDAO coinvolgimentoDAO = new CoinvolgimentoDAO();
        int utente = (int)req.getSession().getAttribute("utente");

        ArrayList<AcquistoCoinvolgimento> acquistoCoinvolgimentoLista = new ArrayList<>();
        ArrayList<Acquisto> acquisti = acquistoDAO.doRetriveByIdCliente(utente);
        for(Acquisto a : acquisti){
            AcquistoCoinvolgimento ac = new AcquistoCoinvolgimento();
            ac.setAcquisto(a);
            ac.setProdottiCoinvolti(coinvolgimentoDAO.doRetriveByAcquisto(a.getId()));
            acquistoCoinvolgimentoLista.add(ac);
        }
        req.setAttribute("acquisti", acquistoCoinvolgimentoLista);

        RequestDispatcher dispatcher = req.getRequestDispatcher("WEB-INF/mostraAcquisti");
        dispatcher.forward(req, resp);
    }
}
