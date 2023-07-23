package Model;

import java.sql.*;
import java.util.ArrayList;

public class AcquistoDAO {
    public void doSave(Acquisto a) throws RuntimeException{
        try{
            Connection connection = ConPool.getConnection();
            PreparedStatement statement = connection.prepareStatement("INSERT INTO ordine (id_ordine, data_acquisto, importo, emailCliente) VALUES (?, ?, ?, ?)",
                    Statement.RETURN_GENERATED_KEYS);
            statement.setInt(1, a.getId());
            statement.setDate(2, (java.sql.Date)a.getData());
            statement.setFloat(3, a.getImporto());
            statement.setString(4, a.getEmailCliente());

            if(statement.executeUpdate() != 1){
                throw new RuntimeException("INSERT error.");
            }

            connection.close();

        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Acquisto> doRetriveByEmailCliente(String email) throws RuntimeException{
        try{
            Connection connection = ConPool.getConnection();
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM ordine WHERE EmailCliente = ?");
            statement.setString(1, email);

            ResultSet rs = statement.executeQuery();
            ArrayList<Acquisto> acquisti = new ArrayList<>();
            while(rs.next()){
                Acquisto a = new Acquisto();
                a.setId(rs.getInt(1));
                a.setData(rs.getDate(2));
                a.setImporto(rs.getFloat(3));
                a.setEmailCliente(rs.getString(4));
                acquisti.add(a);
            }

            connection.close();
            return acquisti;

        }catch(SQLException e){
            throw new RuntimeException(e);
        }

    }

    public Acquisto doRetriveById(int id) throws RuntimeException{
        try{
            Connection connection = ConPool.getConnection();
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM ordine WHERE ID_ordine = ?");
            statement.setInt(1, id);

            ResultSet rs = statement.executeQuery();
            Acquisto a = null;
            if(rs.next()){
                a = new Acquisto();
                a.setId(rs.getInt(1));
                a.setData(rs.getDate(2));
                a.setImporto(rs.getFloat(3));
                a.setEmailCliente(rs.getString(4));
            }

            connection.close();
            return a;

        }catch(SQLException e){
            throw new RuntimeException(e);
        }

    }
}
