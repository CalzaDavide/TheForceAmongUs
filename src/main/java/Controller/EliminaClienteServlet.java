package Controller;

import Model.AcquistoDAO;
import Model.Cliente;
import Model.ClienteDAO;
import Model.CoinvolgimentoDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/elimina-cliente")
public class EliminaClienteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String emailCliente = req.getParameter("cliente");
        ClienteDAO clienteDAO = new ClienteDAO();
        AcquistoDAO acquistoDAO = new AcquistoDAO();

        //Se il cliente da eliminare esiste, vengnono anche eliminati anche gli acquisti
        if(clienteDAO.doDeleteByEmail(emailCliente))
            acquistoDAO.doDeleteByEmail(emailCliente);

        RequestDispatcher dispatcher = req.getRequestDispatcher("mostraUtenti.jsp");
        dispatcher.forward(req, resp);
    }
}
