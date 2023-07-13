package Model;

import java.sql.*;
import java.util.ArrayList;

public class CarrelloDAO {
    public void doSave(String emailCliente, int idProdotto) throws RuntimeException{
        try{
            Connection con = ConPool.getConnection();

            PreparedStatement ps = con.prepareStatement("SELECT ID_Prodotto, Quantita FROM oggetto_carrello WHERE EmailCliente = ?");
            ps.setString(1, emailCliente);
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
                statement = con.prepareStatement("INSERT INTO amongus.oggetto_carrello (quantita, EmailCliente, ID_Prodotto) VALUES (?, ?, ?)",
                        Statement.RETURN_GENERATED_KEYS);
                statement.setInt(1, 1);
                statement.setString(2, emailCliente);
                statement.setInt(3, idProdotto);
            }
            if (statement.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
            con.close();
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    public ArrayList<OggettoQuantita> doRetriveByCliente(String emailCliente){
        try{
            Connection con = ConPool.getConnection();
            PreparedStatement statement= con.prepareStatement("SELECT ID_Prodotto, Quantita FROM oggetto_carrello WHERE EmailCliente = ?");
            statement.setString(1, emailCliente);

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

            con.close();
            return results;

        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

    public void doDeleteByIdProdotto(String emailCliente, int idProdotto) throws RuntimeException{
        try{
            Connection con = ConPool.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM oggetto_carrello WHERE ID_Prodotto =? and EmailCliente =?");
            ps.setInt(1, idProdotto);
            ps.setString(2, emailCliente);

            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("DELETE error.");
            }
            con.close();

        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

    public void doDeleteByIdCliente(String emailCliente){
        try{
            Connection con = ConPool.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM oggetto_carrello WHERE EmailCliente =?");
            ps.setString(1, emailCliente);

            ps.executeUpdate();

            con.close();

        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }
}
