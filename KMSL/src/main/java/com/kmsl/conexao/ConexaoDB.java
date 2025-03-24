package com.kmsl.conexao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoDB {
    private static final String URL = "jdbc:mysql://localhost:3306/bancodb";
    private static final String USUARIO = "root";
    private static final String SENHA = "Michel*150198";

    public static Connection conexao() {
        Connection conexao = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexao = DriverManager.getConnection(URL,USUARIO,SENHA);
            System.out.println("Conexão bem-sucedida!");
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Erro ao conectar: " + e.getMessage());
        }
        return conexao;
    }
}
