package com.kmsl.model;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmsl.conexao.ConexaoDB;

@WebServlet("/CadUsuarioServlet")
public class CadUsuario extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String cidade = request.getParameter("cidade");
        String estado = request.getParameter("estado");
        
        if (nome == null || nome.isEmpty() || email == null || email.isEmpty() || cidade == null || cidade.isEmpty() || estado == null || estado.isEmpty()) {
            out.println("Preencha todos os campos!");
            return;
        }
        
        try (Connection conexao = ConexaoDB.conexao()) {
            String sql = "INSERT INTO usuarios (nome, email, cidade, estado) VALUES (?, ?, ?, ?)";
            try (PreparedStatement stmt = conexao.prepareStatement(sql)) {
                stmt.setString(1, nome);
                stmt.setString(2, email);
                stmt.setString(3, cidade);
                stmt.setString(4, estado);
                
                int linhasAfetadas = stmt.executeUpdate();
                
                if (linhasAfetadas > 0) {
                    out.println("Usuário cadastrado com sucesso!");
                } else {
                    out.println("Erro ao cadastrar usuário.");
                }
            }
        } catch (SQLException e) {
            out.println("Erro ao cadastrar usuário: " + e.getMessage());
        }
    }
}

