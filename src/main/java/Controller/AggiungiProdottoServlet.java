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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProdottoDAO pd = new ProdottoDAO();
        Prodotto prodotto = new Prodotto();

        //continua a generare id finchè non ne genera uno libero
        do {
            prodotto.setId(Prodotto.generateID());
        }while(pd.doRetrieveById(prodotto.getId()) != null);

        //Imposta i vari parametri del nuovo prodotto
        prodotto.setNome(request.getParameter("nome"));
        prodotto.setPercentuale_sconto(Double.parseDouble(request.getParameter("percentuale_sconto")));
        prodotto.setCosto(Double.parseDouble(request.getParameter("costo")));
        prodotto.setEspansione(request.getParameter("espansione"));
        prodotto.setTipologia(request.getParameter("tipologia"));
        prodotto.setImmagine(request.getParameter("immagine"));

        //salva il prodotto nel database e ritorna alla homepage
        ProdottoDAO prodottoDAO = new ProdottoDAO();
        prodottoDAO.doSave(prodotto);

        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }
}
