package resources.data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Banco {
    private Connection conn;
    private static Banco b = new Banco();

    private String url = "jdbc:mysql://library.clkiqc8m2zfr.us-east-2.rds.amazonaws.com/biblioteca";
    private String usr = "admin";
    private String pass = "Banco4444";


    public Banco() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, usr, pass);
        } catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
    }


    public String getUsuario(String login) {
        String nomeCompleto = "";
        String query = "SELECT nome FROM usuario WHERE login = ?";

        try (PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setString(1, login);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    nomeCompleto = rs.getString("nome");
                }
            }
        } catch (Exception e) {
            System.out.println("Erro ao buscar usuário: " + e.getMessage());
        }
        return nomeCompleto;
    }



    public static Banco getInstance() {
        return b;
    }


    public Connection getConnection() {
        return conn;
    }
}
