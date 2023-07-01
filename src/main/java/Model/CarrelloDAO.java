package Model;

import java.sql.*;
import java.util.ArrayList;

public class CarrelloDAO {
    public void doSave(int idCliente, int idProdotto) throws RuntimeException{
        try{
            Connection con = ConPool.getConnection();

            PreparedStatement ps = con.prepareStatement("SELECT ID_Prodotto, Quantita FROM oggetto_carrello WHERE ID_Cliente = ?");
            ps.setInt(1, idCliente);
            ResultSet rs = ps.executeQuery();

            int q = -1;
            while(rs.next()){
                if(rs.getInt(1) == idProdotto){
                    q = rs.getInt(2);
                    break;
                }
            }

            PreparedStatement statement;
            if(q>0){
                statement = con.prepareStatement("UPDATE oggetto_carrello SET Quantita = ? WHERE ID_Prodotto = ?");
                statement.setInt(1, q+1);
                statement.setInt(2, idProdotto);
            }else {
                statement = con.prepareStatement("INSERT INTO amongus.oggetto_carrello (quantita, ID_Cliente, ID_Prodotto) VALUES (?, ?, ?)",
                        Statement.RETURN_GENERATED_KEYS);
                statement.setInt(1, 1);
                statement.setInt(2, idCliente);
                statement.setInt(3, idProdotto);
            }
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
                oq.setQuantita(rs.getInt(2));
                oq.setProdotto(
                        prodottoDAO.doRetrieveById(
                                rs.getInt(1)));
                results.add(oq);
            }
            return results;

        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

    public void doDeleteByIdProdotto(int idCliente, int idProdotto) throws RuntimeException{
        try{
            Connection con = ConPool.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM oggetto_carrello WHERE ID_Prodotto =? and ID_Cliente =?");
            ps.setInt(1, idProdotto);
            ps.setInt(2, idCliente);

            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("DELETE error.");
            }

        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

    public void doDeleteByIdCliente(int idCliente){
        try{
            Connection con = ConPool.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM oggetto_carrello WHERE ID_Cliente =?");
            ps.setInt(1, idCliente);

            ps.executeUpdate();

        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }
}
