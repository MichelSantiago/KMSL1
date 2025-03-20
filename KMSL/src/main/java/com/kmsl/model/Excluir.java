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

@WebServlet("/ExcluirServlet")
public class Excluir extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String codigoProduto = request.getParameter("codigoProduto");
        
        if (codigoProduto != null && !codigoProduto.isEmpty()) {
            try (Connection conexao = ConexaoDB.conectar()) {
                String sql = "DELETE FROM produtos WHERE codigo = ?";
                try (PreparedStatement stmt = conexao.prepareStatement(sql)) {
                    stmt.setString(1, codigoProduto);
                    int linhasAfetadas = stmt.executeUpdate();
                    
                    if (linhasAfetadas > 0) {
                        response.getWriter().write("Produto excluído com sucesso!");
                    } else {
                        response.getWriter().write("Produto não encontrado.");
                    }
                }
            } catch (SQLException e) {
                response.getWriter().write("Erro ao excluir o produto: " + e.getMessage());
            }
        } else {
            response.getWriter().write("Código do produto inválido.");
        }
    }
}
