package com.kmsl.model;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmsl.conexao.ConexaoDB;

@WebServlet("/CadProdServlet")
public class CadProd extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String codigo = request.getParameter("codigo");
        String descricao = request.getParameter("descricao");
        String quantidade = request.getParameter("quantidade");
        
        if (codigo != null && descricao != null && quantidade != null && !codigo.isEmpty() && !descricao.isEmpty() && !quantidade.isEmpty()) {
            try (Connection conexao = ConexaoDB.conexao()) {
                String sql = "INSERT INTO produtos (codigo, descricao, quantidade) VALUES (?, ?, ?)";
                try (PreparedStatement stmt = conexao.prepareStatement(sql)) {
                    stmt.setString(1, codigo);
                    stmt.setString(2, descricao);
                    stmt.setInt(3, Integer.parseInt(quantidade));
                    
                    int linhasAfetadas = stmt.executeUpdate();
                    if (linhasAfetadas > 0) {
                        response.getWriter().write("Produto cadastrado com sucesso!");
                    } else {
                        response.getWriter().write("Erro ao cadastrar o produto.");
                    }
                }
            } catch (SQLException e) {
                response.getWriter().write("Erro ao cadastrar o produto: " + e.getMessage());
            }
        } else {
            response.getWriter().write("Preencha todos os campos corretamente.");
        }
    }
}