<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Painel</title>
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
        .painel-container {
            background: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 500px;
            text-align: center;
        }
        h2 {
            color: #0056b3;
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
    </style>
</head>
<body>
    <div class="painel-container">
        <h2>Painel Principal</h2>
        <!-- Opções do painel principal -->
        <button class="botao" onclick="window.location.href='cadProd.jsp'">Cadastro de Produto</button>
        <button class="botao" onclick="window.location.href='consulta.jsp'">Consulta de Produto</button>
        <button class="botao" onclick="window.location.href='alteracao.jsp'">Alteração de Produto</button>
        <button class="botao" onclick="window.location.href='excluir.jsp'">Exclusão de Produto</button>
    </div>
</body>
</body>
</html>