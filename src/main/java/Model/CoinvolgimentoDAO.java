package Model;

import com.mysql.cj.x.protobuf.MysqlxPrepare;

import java.sql.*;
import java.util.ArrayList;

public class CoinvolgimentoDAO {
    public void doSave(Coinvolgimento coinvolgimento) throws RuntimeException{
        try{
            Connection connection = ConPool.getConnection();
            PreparedStatement statement = ConPool.getConnection().prepareStatement("INSERT INTO coinvolgimento (Quantita, ID_Prodotto, Ordine) values (?, ?, ?)",
                    Statement.RETURN_GENERATED_KEYS);
            statement.setInt(1, coinvolgimento.getQuantita());
            statement.setInt(2, coinvolgimento.getProdotto().getId());
            statement.setInt(3, coinvolgimento.getIdAcquisto());

            if (statement.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }

        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

    public ArrayList<Coinvolgimento> doRetriveByAcquisto(int idAcquisto) {
        try{
            Connection connection = ConPool.getConnection();
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM coinvolgimento WHERE Ordine = ?");
            statement.setInt(1, idAcquisto);

            ResultSet rs = statement.executeQuery();
            ArrayList<Coinvolgimento> coinvolgimenti = new ArrayList<>();
            while(rs.next()){
                Coinvolgimento c = new Coinvolgimento();
                c.setQuantita(rs.getInt(1));
                c.setProdotto((new ProdottoDAO()).doRetrieveById(rs.getInt(2)));
                c.setIdAcquisto(rs.getInt(3));
                coinvolgimenti.add(c);
            }

            connection.close();
            return coinvolgimenti;

        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }

    public void doDeleteByAcquisto(int acquisto) throws RuntimeException{
        try{
            Connection con = ConPool.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM coinvolgimento WHERE Ordine =?");
            ps.setInt(1, acquisto);

            if (ps.executeUpdate() < 1) {
                throw new RuntimeException("DELETE error.");
            }
            con.close();

        }catch(SQLException e){
            throw new RuntimeException(e);
        }
    }
}
