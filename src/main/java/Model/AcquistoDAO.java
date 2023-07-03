package Model;

import java.sql.*;
import java.util.ArrayList;

public class AcquistoDAO {
    public void doSave(Acquisto a) throws RuntimeException{
        try{
            Connection connection = ConPool.getConnection();
            PreparedStatement statement = connection.prepareStatement("INSERT INTO ordine (id_ordine, data_acquisto, importo, id_cliente) VALUES (?, ?, ?, ?)",
                    Statement.RETURN_GENERATED_KEYS);
            statement.setInt(1, a.getId());
            statement.setDate(2, (java.sql.Date)a.getData());
            statement.setFloat(3, a.getImporto());
            statement.setInt(4, a.getIdCliente());

            if(statement.executeUpdate() != 1){
                throw new RuntimeException("INSERT error.");
            }
        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Acquisto> doRetriveByIdCliente(int utente) throws RuntimeException{
        try{
            Connection connection = ConPool.getConnection();
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM ordine WHERE ID_Cliente = ?");
            statement.setInt(1, utente);

            ResultSet rs = statement.executeQuery();
            ArrayList<Acquisto> acquisti = new ArrayList<>();
            while(rs.next()){
                Acquisto a = new Acquisto();
                a.setId(rs.getInt(1));
                a.setData(rs.getDate(2));
                a.setImporto(rs.getFloat(3));
                a.setIdCliente(rs.getInt(4));
                acquisti.add(a);
            }

            return acquisti;

        }catch(SQLException e){
            throw new RuntimeException(e);
        }

    }
}
