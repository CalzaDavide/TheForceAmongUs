package Model;

import java.sql.*;
import java.util.ArrayList;

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

    public ArrayList<OggettoQuantita> doRetriveByCliente(int idCliente){
        try{
            Connection con = ConPool.getConnection();
            PreparedStatement statement= con.prepareStatement("SELECT ID_Prodotto, Quantita FROM oggetto_carrello WHERE ID_Cliente = ?");
            statement.setInt(1, idCliente);

            ResultSet rs = statement.executeQuery();

            ArrayList<OggettoQuantita> results = new ArrayList<>();
            ProdottoDAO prodottoDAO = new ProdottoDAO();

            while(rs.next()){
                OggettoQuantita oq = new OggettoQuantita();
                oq.setQuantita(rs.getInt(1));
                oq.setProdotto(
                        prodottoDAO.doRetrieveById(
                                rs.getInt(2)));
                results.add(oq);
            }
            return results;

        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }
}
