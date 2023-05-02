package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class ClienteDAO {
    public void doSave(Cliente cliente) {
        try (Connection con = ConPool.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO cliente (nome, cognome, saldo) VALUES(?,?,?)",
                    Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, cliente.getNome());
            ps.setString(2, cliente.getCognome());
            ps.setDouble(3, cliente.getSaldo());
            if (ps.executeUpdate() != 1) {
                throw new RuntimeException("INSERT error.");
            }
            ResultSet rs = ps.getGeneratedKeys();
            rs.next();
            int id = rs.getInt(1);
            Cliente.setId(id);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
