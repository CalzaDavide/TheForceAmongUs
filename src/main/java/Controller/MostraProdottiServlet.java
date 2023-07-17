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

        ArrayList<Prodotto> prodotti;

        if(espansione!= null)
            prodotti = pd.doRetrieveByEspansione(espansione);
        else if (tipologia!= null)
            prodotti = pd.doRetrieveByTipologia(tipologia);
        else
            prodotti = pd.doRetrieveByNome(request.getParameter("ricerca"));
        request.setAttribute("prodotti", prodotti);

        RequestDispatcher rd = request.getRequestDispatcher(address);

        rd.forward(request, response);
    }
}
