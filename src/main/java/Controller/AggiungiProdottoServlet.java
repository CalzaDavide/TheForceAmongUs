package Controller;

import Model.Prodotto;
import Model.ProdottoDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AggiungiProdottoServlet", value = "/aggiungi-prodotto")
public class AggiungiProdottoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Prodotto prodotto = new Prodotto();
        prodotto.setId(Integer.parseInt(req.getParameter("id")));
        prodotto.setNome(req.getParameter("nome"));
        prodotto.setQuantita(Integer.parseInt(req.getParameter("quantita")));
        prodotto.setPercentuale_sconto(Double.parseDouble(req.getParameter("percentuale_sconto")));
        prodotto.setCosto(Double.parseDouble(req.getParameter("costo")));
        prodotto.setEspansione(req.getParameter("espansione"));
        prodotto.setTipologia(req.getParameter(prodotto.getTipologia()));

        ProdottoDAO prodottoDAO = new ProdottoDAO();
        prodottoDAO.doSave(prodotto);

        RequestDispatcher dispatcher = req.getRequestDispatcher("index.html");
        dispatcher.forward(req, resp);
    }
}
