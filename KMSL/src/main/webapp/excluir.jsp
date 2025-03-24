<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exclusão de produto</title>
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
        .exclusao-container {
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
            background-color: #FF0000;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }
        .botao:hover {
            background-color: #CC0000;
        }
        .mensagem {
            margin-top: 20px;
            font-size: 14px;
            color: #333;
            text-align: left;
        }
    </style>
    <script>
        function excluirProduto() {
            let codigoProduto = document.getElementById("codigoProduto").value;
            let mensagemDiv = document.getElementById("mensagem");
            
            if (codigoProduto) {
                mensagemDiv.innerHTML = "Produto excluído com sucesso!";
            } else {
                mensagemDiv.innerHTML = "Informe o código do produto antes de excluir.";
            }
        }
    </script>
</head>
<body>
    <div class="exclusao-container">
        <h2>Exclusão de Produto</h2>
        <label for="codigoProduto">Código do Produto:</label>
        <input type="text" id="codigoProduto" name="codigoProduto" required>
        
        <button class="botao" type="button" onclick="excluirProduto()">Excluir Produto</button>
        <button class="botao" type="button" onclick="window.location.href='painel.jsp'">Voltar</button>
        <div id="mensagem" class="mensagem"></div>
    </div>
</body>
	<%
	int cod;
	cod=Integer.parseInt(request.getParameter("codigoProduto"));
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/bancodb","root,","Michel*150198");
		PreparedStatement st = conexao.prepareStatement("DELETE FROM produtos WHERE codigo_produto=?");
		st.setInt(1, cod);
	int resultado = st.executeUpdate();
		if(resultado == 0){
		out.print("Este produto não está cadastrado");
	}else {
		out.print("O produto foi excluído com sucesso");
	}
		} catch (Exception x){
		out.print("Mensagem de erro:"+ x.getMessage());
		}
	%>
</body>
</html>