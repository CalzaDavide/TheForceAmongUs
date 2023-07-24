package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Model.*;


import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/mostra-prodotti")
public class MostraProdottiServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        this.doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ProdottoDAO  pd = new ProdottoDAO();

        String address = "mostraProdotti.jsp";

        String espansione = request.getParameter("espansione");
        String tipologia = request.getParameter("tipologia");
        String ricerca = request.getParameter("ricerca");

        ArrayList<Prodotto> prodotti;

        //Controlla prima se la ricerca è per espansione
        if(espansione!= null)
            prodotti = pd.doRetrieveByEspansione(espansione);
        //Se non lo è, controlla se è per tipologia di prodotto
        else if (tipologia!= null)
            prodotti = pd.doRetrieveByTipologia(tipologia);
        //In fine controlla la stringa nella barra di ricerca
        else
            prodotti = pd.doRetrieveByNome(ricerca);
        request.setAttribute("prodotti", prodotti);
        request.setAttribute("ricerca", ricerca);

        RequestDispatcher rd = request.getRequestDispatcher(address);

        rd.forward(request, response);
    }
}
