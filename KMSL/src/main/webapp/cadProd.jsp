<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection" %>
 
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de produto</title>
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
        .cadastro-container {
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
            margin-top: 10px;
            font-size: 14px;
            color: green;
        }
    </style>
    <script>
        function exibirMensagem(sucesso) {
            let mensagemDiv = document.getElementById("mensagem");
            if (sucesso) {
                mensagemDiv.innerHTML = "Produto cadastrado com sucesso!";
                mensagemDiv.style.color = "green";
            } else {
                mensagemDiv.innerHTML = "Erro ao cadastrar produto!";
                mensagemDiv.style.color = "red";
            }
        }
    </script>
</head>
<body>
    <div class="cadastro-container">
        <h2>Cadastro de Produto</h2>
        <form action="/cadastrarProduto" method="post" onsubmit="exibirMensagem(true); return false;">
            <label for="codigo">Código do Produto:</label>
            <input type="text" id="codigo" name="codigo" required>

            <label for="descricao">Descrição:</label>
            <input type="text" id="descricao" name="descricao" required>

            <label for="quantidade">Quantidade:</label>
            <input type="number" id="quantidade" name="quantidade" required>

            <button class="botao" type="submit">Cadastrar Produto</button>
            <button class="botao" type="button" onclick="window.location.href='painel.jsp'">Voltar</button>
        </form>
        <div id="mensagem" class="mensagem"></div>
    </div>
    <%
    //variaveis que vao receber valores no banco
   try{
    int codigo , quantidade;
    String descricao;
    codigo = Integer.parseInt(request.getParameter("codigo"));
    descricao =request.getParameter("quantidade");
    quantidade = Integer.parseInt(request.getParameter("quantidade"));
 	//conexao banco 
    Connection conexao;
    PreparedStatement st;
    Class.forName("com.mysql.cj.jdbc.Driver");
    conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/bancodb","root,","Michel*150198");
    //iserir dados na tabela
    st = conexao.prepareStatement("INSERT INTO produtos VALUES(?,?,?)");
    st.setInt(1, codigo);
    st.setString(2, descricao);
    st.setInt(3, quantidade);
    st.executeUpdate();
   } catch (Exception x){
    	out.print("Mensagem de erro:"+ x.getMessage());
    }
    %>
</body>
</html>