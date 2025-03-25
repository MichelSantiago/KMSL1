<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alterar Cadastro</title>
</head>
<body>
<style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background: linear-gradient(135deg, #007BFF, #00BFFF, #0056b3);
        }
        .alteracao-container {
            background: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }
        h2 {
            color: #0056b3;
        }
        label {
            display: block;
            margin-bottom: 8px;
            text-align: left;
            color: #333;
        }
        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
        }
        .botao {
            width: 100%;
            background-color: #007BFF;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }
        .botao:hover {
            background-color: #0056b3;
        }
        .mensagem {
            margin-top: 20px;
            font-size: 14px;
            color: #333;
            text-align: left;
        }
</style>
</head>
<body>
    <div class="alteracao-container">
        <h2>Alteração de Produto</h2>
        <form action="alteracao.jsp" method="post">
            <label for="codigoProduto">Código do Produto:</label>
            <input type="text" id="codigoProduto" name="codigoProduto" required>

            <label for="descricao">Descrição:</label>
            <input type="text" id="descricao" name="descricao" required>

            <label for="quantidade">Quantidade:</label>
            <input type="number" id="quantidade" name="quantidade" required>

            <button class="botao" type="submit">Salvar Alterações</button>
            <button class="botao" type="button" onclick="window.location.href='painel.jsp'">Voltar</button>
        </form>
    </div>

    <%
    String mensagem = "";
    try {
        String codigoParam = request.getParameter("codigoProduto");
        String descricao = request.getParameter("descricao");
        String quantidadeParam = request.getParameter("quantidade");

        if (codigoParam != null && descricao != null && quantidadeParam != null) {
            int codigo = Integer.parseInt(codigoParam);
            int quantidade = Integer.parseInt(quantidadeParam);

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/bancodb", "root", "Michel*150198");

            PreparedStatement st = conexao.prepareStatement("UPDATE produtos SET descricao = ?, quantidade = ? WHERE codigo = ?");
            st.setString(1, descricao);
            st.setInt(2, quantidade);
            st.setInt(3, codigo);

            int linhasAfetadas = st.executeUpdate();
            if (linhasAfetadas > 0) {
                mensagem = "Produto atualizado com sucesso!";
            } else {
                mensagem = "Nenhum produto encontrado com esse código.";
            }

            conexao.close();
        } else {
            mensagem = "Preencha todos os campos!";
        }
    } catch (Exception e) {
        mensagem = "Erro ao atualizar produto: " + e.getMessage();
    }
    %>

    <div class="mensagem"><%= mensagem %></div>

</body>
</html>
