<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de usuário</title>
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
            margin-top: 10px;
            text-align: left;
        }
        input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
        }
        button {
            width: 100%;
            background-color: #007BFF;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
        function exibirMensagem(sucesso) {
            let mensagemDiv = document.getElementById("mensagem");
            if (sucesso) {
                mensagemDiv.innerHTML = "Usuario cadastrado com sucesso!";
                mensagemDiv.style.color = "green";
            } else {
                mensagemDiv.innerHTML = "Erro ao cadastrar o usuário!";
                mensagemDiv.style.color = "red";
            }
        }
    </script>
    </head>
<body>
    <div class="cadastro-container">
        <h2>Cadastro de Usuário</h2>     
        <form action="cadUsuario.jsp" method="post">
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" required>

            <label for="email">E-mail:</label>
            <input type="email" id="email" name="email" required>

            <label for="cidade">Cidade:</label>
            <input type="text" id="cidade" name="cidade" required>

            <label for="estado">Estado:</label>
            <input type="text" id="estado" name="estado" required>
            
            <button class="botao" type="submit">Cadastrar usuário</button>
            <button type="button" onclick="window.location.href='index.jsp'">Voltar</button>
        </form>
    </div>
</body>
<%
	try{
    //variaveis que vao receber valores no banco
    	String nome , email , cidade ,estado;
		nome =request.getParameter("nome");
		email =request.getParameter("email");
		cidade =request.getParameter("cidade");
    	estado =request.getParameter("estado");
    
 	//conexao banco 
  	  Connection conexao;
      PreparedStatement st;
  	  Class.forName("com.mysql.cj.jdbc.Driver");
  	  conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/bancodb","root,","Michel*150198");
    //iserir dados na tabela
    	st = conexao.prepareStatement("INSERT INTO usuario VALUES(?,?,?)");
    	st.setString(1, nome);
    	st.setString(2, email);
    	st.setString(3, cidade);
    	st.setString(4, estado);
    	st.executeUpdate();
	} catch (Exception x){
    		out.print("Mensagem de erro:"+ x.getMessage());
		}
	
    %>
</body>

</html>