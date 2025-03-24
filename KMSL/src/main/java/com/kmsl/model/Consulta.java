package com.kmsl.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kmsl.conexao.ConexaoDB;

@WebServlet("/ConsultaServlet")
public class Consulta extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String busca = request.getParameter("busca");
        
        try (Connection conexao = ConexaoDB.conexao()) {
            String sql = "SELECT * FROM produtos WHERE codigo = ? OR descricao LIKE ?";
            try (PreparedStatement stmt = conexao.prepareStatement(sql)) {
                stmt.setString(1, busca);
                stmt.setString(2, "%" + busca + "%");
                
                ResultSet rs = stmt.executeQuery();
                
                out.println("<table border='1'>");
                out.println("<tr><th>Código</th><th>Descrição</th><th>Quantidade</th></tr>");
                
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("codigo") + "</td>");
                    out.println("<td>" + rs.getString("descricao") + "</td>");
                    out.println("<td>" + rs.getInt("quantidade") + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
            }
        } catch (SQLException e) {
            out.println("Erro ao consultar produto: " + e.getMessage());
        }
    }
}