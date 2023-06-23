package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class CarrelloDAO {
    public void doSave(int idCliente, int idProdotto, int quantita) throws RuntimeException{
        try{
            Connection con = ConPool.getConnection();
            PreparedStatement statement = con.prepareStatement("INSERT INTO amongus.oggetto_carrello (quantita, ID_Cliente, ID_Prodotto) VALUES (?, ?, ?)",
                    Statement.RETURN_GENERATED_KEYS);
            statement.setInt(1, quantita);
            statement.setInt(2, idCliente);
            statement.setInt(3, idProdotto);

            if (statement.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }

        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }
}
