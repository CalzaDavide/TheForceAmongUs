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
                    "INSERT INTO amongus.cliente (account_ID, Nome, Cognome, Pswd, Email, Saldo, Indirizzo_via, Codice_Postale, N_civico, Totale_carrello, AdminValue) VALUES(?,?,?,?,?,?,?,?,?,?,?)",
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
            ps.setBoolean(11, cliente.getAdminValue());

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

                c.setId(resultSet.getInt(1));

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

    public Cliente doRetrieveById(int id){

        ResultSet resultSet;

        Cliente c = null;

        try (Connection con = ConPool.getConnection()) {

            PreparedStatement  ps = con.prepareStatement("SELECT * FROM amongus.cliente WHERE account_ID = ?");
            ps.setInt(1, id);
            resultSet = ps.executeQuery();

            if(resultSet.next()) {

                c = new Cliente();

                c.setId(resultSet.getInt(1));

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

    public Cliente doRetrieveByEmail(String email){

        ResultSet resultSet;

        Cliente c = null;

        try (Connection con = ConPool.getConnection()) {
            PreparedStatement  ps = con.prepareStatement("SELECT * FROM amongus.cliente WHERE Email=?");
            ps.setString(1, email);
            resultSet = ps.executeQuery();

            if(resultSet.next()) {

                c = new Cliente();

                c.setId(resultSet.getInt(1));

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

}
