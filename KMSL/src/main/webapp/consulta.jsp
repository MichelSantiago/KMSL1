<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        .consulta-container {
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
        .resultado {
            margin-top: 20px;
            font-size: 14px;
            color: #333;
            text-align: left;
        }
    </style>
    <script>
        function consultarProduto() {
            let termoBusca = document.getElementById("termoBusca").value;
            let resultadoDiv = document.getElementById("resultado");
            
            // Simulação de busca
            if (termoBusca === "123") {
                resultadoDiv.innerHTML = "<strong>Código:</strong> 123<br><strong>Descrição:</strong> Produto Exemplo<br><strong>Quantidade:</strong> 50";
            } else {
                resultadoDiv.innerHTML = "Produto não encontrado.";
            }
        }
    </script>
</head>
<body>
    <div class="consulta-container">
        <h2>Consulta de Produto</h2>
        <label for="termoBusca">Código ou Descrição:</label>
        <input type="text" id="termoBusca" name="termoBusca" required>
        <button class="botao" type="button" onclick="consultarProduto()">Buscar</button>
        <button class="botao" type="button" onclick="window.location.href='painel.jsp'">Voltar</button>
        <div id="resultado" class="resultado"></div>
    </div>
</body>
</body>
</html>