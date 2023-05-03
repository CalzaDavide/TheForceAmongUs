package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class ProdottoDAO {
    public void doSave(Prodotto prodotto) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO Prodotto (ID_Prodotto, Nome, Quantita, percentuale_Sconto, Costo, Espansione, Tipologia) VALUES(?,?,?,?,?,?,?)",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, prodotto.getId());
            ps.setString(2, prodotto.getNome());
            ps.setInt(3, prodotto.getQuantita());
            ps.setDouble(4, prodotto.getPercentuale_sconto());
            ps.setDouble(5, prodotto.getCosto());
            ps.setString(6, prodotto.getEspansione());
            ps.setString(7, prodotto.getTipologia());

            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
