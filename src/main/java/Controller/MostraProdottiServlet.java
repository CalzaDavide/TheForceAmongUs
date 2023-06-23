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

        ArrayList<Prodotto> prodotti;

        ProdottoDAO  pd = new ProdottoDAO();

        String address = "WEB-INF/mostraProdotti.jsp";

        RequestDispatcher rd;

        prodotti = pd.doRetrieveAll();
        String ricerca = request.getParameter("ricerca");
        if(ricerca != null && !ricerca.equals(""))
            for (Prodotto p : prodotti){
                if(!p.getNome().contains(ricerca))
                    prodotti.remove(p);
            }

        request.setAttribute("prodotti", prodotti);

        rd = request.getRequestDispatcher(address);

        rd.forward(request, response);
    }
}
