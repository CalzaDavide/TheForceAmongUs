package Controller;

import Model.Cliente;
import Model.ClienteDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


@WebServlet("/login")
public class LogInServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession sessioneAttuale = request.getSession();

        String email = request.getParameter("email");
        String pswd = request.getParameter("pswd");

        ClienteDAO cd = new ClienteDAO();
        Cliente utente = cd.doRetrieveByEmailPassword(email, pswd);

        //Controllo email
        Pattern pattern = Pattern.compile("[^\\s@]+@[^\\s@]+\\.[^\\s@]+");
        Matcher matcher = pattern.matcher(email);

        String address;
        String logInStatus;

        //L'accesso verrà effettuato se email e password corrispondono a un account
        if (utente != null && matcher.find()) {
            address = "index.jsp";
            sessioneAttuale.setAttribute("utente", utente);
            logInStatus = "accesso";

        } else {
            //altrimenti si viene rispediti alla schermata di login con un messaggio di errore
            address = "accesso.jsp";
            logInStatus = "errato";
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(address);
        request.setAttribute("logInStatus", logInStatus);
        dispatcher.forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}