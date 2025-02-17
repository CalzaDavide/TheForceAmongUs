package Model;

import java.sql.*;
import java.util.ArrayList;

public class ProdottoDAO {
    public void doSave(Prodotto prodotto) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO Prodotto (ID_Prodotto, Nome, percentuale_Sconto, Costo, Espansione, Tipologia, Immagine) VALUES(?,?,?,?,?,?,?)",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, prodotto.getId());
            ps.setString(2, prodotto.getNome());
            ps.setDouble(3, prodotto.getPercentuale_sconto());
            ps.setDouble(4, prodotto.getCosto());
            ps.setString(5, prodotto.getEspansione());
            ps.setString(6, prodotto.getTipologia());
            ps.setString(7, prodotto.getImmagine());

            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public ArrayList<Prodotto> doRetrieveAll(){

        ArrayList<Prodotto> prodotti = new ArrayList<>();

        Statement statement;

        ResultSet resultSet;

        Prodotto p;

        try (Connection con = ConPool.getConnection()) {

            statement = con.createStatement();

            resultSet = statement.executeQuery("SELECT * FROM Prodotto");

            while(resultSet.next()) {

                p = new Prodotto();

                p.setId(resultSet.getInt(1));

                p.setNome(resultSet.getString(2));

                p.setPercentuale_sconto(resultSet.getInt(3));

                p.setCosto(resultSet.getDouble(4));

                p.setEspansione(resultSet.getString(5));

                p.setTipologia(resultSet.getString(6));

                p.setImmagine(resultSet.getString(7));

                prodotti.add(p);
            }

            con.close();

            return prodotti;
        }

        catch (SQLException e) {

            throw new RuntimeException(e);
        }
    }

    public Prodotto doRetrieveById(int id){

        ResultSet resultSet;

        Prodotto p = null;

        try (Connection con = ConPool.getConnection()) {

            PreparedStatement  ps = con.prepareStatement("SELECT * FROM Prodotto WHERE ID_Prodotto = ?");
            ps.setInt(1, id);
            resultSet = ps.executeQuery();

            if(resultSet.next()) {

                p = new Prodotto();

                p.setId(resultSet.getInt(1));

                p.setNome(resultSet.getString(2));

                p.setPercentuale_sconto(resultSet.getInt(3));

                p.setCosto(resultSet.getDouble(4));

                p.setEspansione(resultSet.getString(5));

                p.setTipologia(resultSet.getString(6));

                p.setImmagine(resultSet.getString(7));
            }

            con.close();

            return p;
        }

        catch (SQLException e) {

            throw new RuntimeException(e);
        }
    }

    public ArrayList<Prodotto> doRetrieveByTipologia(String tipologia){

        ResultSet resultSet;

        Prodotto p = null;

        try (Connection con = ConPool.getConnection()) {

            PreparedStatement  ps = con.prepareStatement("SELECT * FROM Prodotto WHERE Tipologia = ?");
            ps.setString(1, tipologia);

            resultSet = ps.executeQuery();

            ArrayList<Prodotto> risultati = new ArrayList<>();

            while(resultSet.next()) {

                p = new Prodotto();

                p.setId(resultSet.getInt(1));

                p.setNome(resultSet.getString(2));

                p.setPercentuale_sconto(resultSet.getInt(3));

                p.setCosto(resultSet.getDouble(4));

                p.setEspansione(resultSet.getString(5));

                p.setTipologia(resultSet.getString(6));

                p.setImmagine(resultSet.getString(7));

                risultati.add(p);
            }

            con.close();

            return risultati;
        }

        catch (SQLException e) {

            throw new RuntimeException(e);
        }
    }

    public ArrayList<Prodotto> doRetrieveByEspansione(String espansione){

        ResultSet resultSet;

        Prodotto p = null;

        try (Connection con = ConPool.getConnection()) {

            PreparedStatement  ps = con.prepareStatement("SELECT * FROM Prodotto WHERE Espansione = ?");
            ps.setString(1, espansione);

            resultSet = ps.executeQuery();

            ArrayList<Prodotto> risultati = new ArrayList<>();

            while(resultSet.next()) {

                p = new Prodotto();

                p.setId(resultSet.getInt(1));

                p.setNome(resultSet.getString(2));

                p.setPercentuale_sconto(resultSet.getInt(3));

                p.setCosto(resultSet.getDouble(4));

                p.setEspansione(resultSet.getString(5));

                p.setTipologia(resultSet.getString(6));

                p.setImmagine(resultSet.getString(7));

                risultati.add(p);
            }

            con.close();

            return risultati;
        }

        catch (SQLException e) {

            throw new RuntimeException(e);
        }
    }

    public ArrayList<Prodotto> doRetrieveByNome(String ricerca){

        ResultSet resultSet;

        ArrayList<Prodotto> risultati = new ArrayList<>();

        try (Connection con = ConPool.getConnection()) {

            PreparedStatement  ps = con.prepareStatement("SELECT * FROM Prodotto");
            resultSet = ps.executeQuery();

            while(resultSet.next()) {

                String nome = resultSet.getString(2);
                if(!nome.toLowerCase().contains(ricerca.toLowerCase())){
                    continue;
                }
                Prodotto p = new Prodotto();

                p.setId(resultSet.getInt(1));

                p.setNome(nome);

                p.setPercentuale_sconto(resultSet.getInt(3));

                p.setCosto(resultSet.getDouble(4));

                p.setEspansione(resultSet.getString(5));

                p.setTipologia(resultSet.getString(6));

                p.setImmagine(resultSet.getString(7));
                
                risultati.add(p);
            }

            con.close();

            return risultati;
        }

        catch (SQLException e) {

            throw new RuntimeException(e);
        }
    }
}

