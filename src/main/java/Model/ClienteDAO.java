package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;



public class ClienteDAO {
    public void doSave(Cliente cliente) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO amongus.cliente (Nome, Cognome, Pswd, Email, Saldo, Indirizzo_via, Codice_Postale, N_civico, Totale_carrello, AdminValue) VALUES(?,?,?,?,?,?,?,?,?,?)",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, cliente.getNome());
            ps.setString(2, cliente.getCognome());
            ps.setString(3, cliente.getPswd());
            ps.setString(4, cliente.getEmail());
            ps.setDouble(5, cliente.getSaldo());
            ps.setString(6, cliente.getIndirizzo_Via());
            ps.setInt(7, cliente.getCodice_Postale());
            ps.setInt(8, cliente.getN_Civico());
            ps.setDouble(9, cliente.getTotale_Carrello());
            ps.setBoolean(10, cliente.isAdmin());

            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Cliente> doRetrieveAll() {

        ArrayList<Cliente> clienti = new ArrayList<>();

        Statement statement;

        ResultSet resultSet;

        Cliente c;

        try (Connection con = ConPool.getConnection()) {

            statement = con.createStatement();

            resultSet = statement.executeQuery("SELECT * FROM amongus.cliente");

            while (resultSet.next()) {

                c = new Cliente();

                c.setNome(resultSet.getString(2));

                c.setCognome(resultSet.getString(3));

                c.setPswd(resultSet.getString(4));

                c.setEmail(resultSet.getString(5));

                c.setSaldo(resultSet.getDouble(6));

                c.setIndirizzo_Via(resultSet.getString(7));

                c.setCodice_Postale(resultSet.getInt(8));

                c.setN_Civico(resultSet.getInt(9));

                c.setTotale_Carrello(resultSet.getInt(10));

                c.setAdminValue(resultSet.getBoolean(11));


                clienti.add(c);
            }

            con.close();

            return clienti;
        } catch (SQLException e) {

            throw new RuntimeException(e);
        }
    }

    public Cliente doRetrieveByEmail(String email){

        ResultSet resultSet;

        Cliente c = null;

        try (Connection con = ConPool.getConnection()) {

            PreparedStatement  ps = con.prepareStatement("SELECT * FROM amongus.cliente WHERE account_ID = ?");
            ps.setString(1, email);
            resultSet = ps.executeQuery();

            if(resultSet.next()) {

                c = new Cliente();

                c.setNome(resultSet.getString(2));

                c.setCognome(resultSet.getString(3));

                c.setPswd(resultSet.getString(4));

                c.setEmail(resultSet.getString(5));

                c.setSaldo(resultSet.getDouble(6));

                c.setIndirizzo_Via(resultSet.getString(7));

                c.setCodice_Postale(resultSet.getInt(8));

                c.setN_Civico(resultSet.getInt(9));

                c.setTotale_Carrello(resultSet.getInt(10));

                c.setAdminValue(resultSet.getBoolean(11));
            }

            con.close();

            return c;
        }

        catch (SQLException e) {

            throw new RuntimeException(e);
        }
    }

    public Cliente doRetrieveByEmailPassword(String email, String password){

        ResultSet resultSet;

        Cliente c = null;

        try (Connection con = ConPool.getConnection()) {
            PreparedStatement  ps = con.prepareStatement("SELECT * FROM amongus.cliente WHERE Email=? AND Pswd=SHA1(?)" );
            ps.setString(1, email);
            ps.setString(2, password);
            resultSet = ps.executeQuery();

            if(resultSet.next()) {

                c = new Cliente();

                c.setNome(resultSet.getString(2));

                c.setCognome(resultSet.getString(3));

                c.setPswd(password); //La password salvata nel db è già stata convertita in hash, qui viene fornita non "hashata"

                c.setEmail(resultSet.getString(5));

                c.setSaldo(resultSet.getDouble(6));

                c.setIndirizzo_Via(resultSet.getString(7));

                c.setCodice_Postale(resultSet.getInt(8));

                c.setN_Civico(resultSet.getInt(9));

                c.setTotale_Carrello(resultSet.getInt(10));

                c.setAdminValue(resultSet.getBoolean(11));
            }

            con.close();

            return c;
        }

        catch (SQLException e) {

            throw new RuntimeException(e);
        }
    }

}
