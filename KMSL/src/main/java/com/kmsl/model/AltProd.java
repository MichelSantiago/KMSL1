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

@WebServlet("/AltProdServlet")
public class AltProd extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String codigo = request.getParameter("codigo");
        String descricao = request.getParameter("descricao");
        String quantidadeStr = request.getParameter("quantidade");
        
        if (codigo == null || codigo.isEmpty() || descricao == null || descricao.isEmpty() || quantidadeStr == null || quantidadeStr.isEmpty()) {
            out.println("Preencha todos os campos!");
            return;
        }
        
        int quantidade = Integer.parseInt(quantidadeStr);
        
        try (Connection conexao = ConexaoDB.conectar()) {
            String sql = "UPDATE produtos SET descricao = ?, quantidade = ? WHERE codigo = ?";
            try (PreparedStatement stmt = conexao.prepareStatement(sql)) {
                stmt.setString(1, descricao);
                stmt.setInt(2, quantidade);
                stmt.setString(3, codigo);
                
                int linhasAfetadas = stmt.executeUpdate();
                
                if (linhasAfetadas > 0) {
                    out.println("Produto atualizado com sucesso!");
                } else {
                    out.println("Produto não encontrado!");
                }
            }
        } catch (SQLException e) {
            out.println("Erro ao atualizar produto: " + e.getMessage());
        }
    }
}

