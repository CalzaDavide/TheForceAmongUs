package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;


public class ClienteDAO {
    public void doSave(Cliente cliente) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO cliente (account_ID, nome, cognome, pswd, Email, Saldo, indirizzo_via, Codice_Postale, N_civico, Totale_carrello) VALUES(?,?,?,?,?,?,?,?,?,?)",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, cliente.getId());
            ps.setString(2, cliente.getNome());
            ps.setString(3, cliente.getCognome());
            ps.setString(4, cliente.getPswd());
            ps.setString(5, cliente.getEmail());
            ps.setDouble(6, cliente.getSaldo());
            ps.setString(7, cliente.getIndirizzo_Via());
            ps.setInt(8, cliente.getCodice_Postale());
            ps.setInt(9, cliente.getN_Civico());
            ps.setDouble(10, cliente.getTotale_Carrello());

            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Cliente> doRetrieveAll(){

        ArrayList<Cliente> customers = new ArrayList<>();

        Statement st;

        ResultSet rs;

        Cliente c;

        try (Connection con = ConPool.getConnection()) {

            st = con.createStatement();

            rs = st.executeQuery("SELECT * FROM Cliente WHERE 1=1");

            while(rs.next()) {

                c = new Cliente();

                c.setId(rs.getInt(1));

                c.setNome(rs.getString(2));

                c.setCognome(rs.getString(3));

                c.setSaldo(rs.getDouble(4));

                customers.add(c);
            }

            con.close();

            return customers;
        }

        catch (SQLException e) {

            throw new RuntimeException(e);
        }
    }
}
