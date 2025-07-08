<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AI Chatbot Response</title>
    <style>
    body {
        margin: 0;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
        min-height: 100vh;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: flex-start;
        padding: 40px 20px;
    }

    h2, h3, h4 {
        color: #2c3e50;
        text-align: center;
    }

    form {
        background-color: #ffffff;
        padding: 20px;
        margin: 15px auto;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        width: 90%;
        max-width: 500px;
    }

    label, input, textarea {
        display: block;
        width: 100%;
        margin-bottom: 15px;
        font-size: 16px;
    }

    input[type="text"],
    input[type="password"],
    textarea {
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    input[type="submit"] {
        background-color: #3498db;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #2980b9;
    }

    ul {
        list-style: none;
        padding: 0;
        margin-top: 10px;
    }

    li {
        background-color: #fff;
        padding: 10px;
        margin: 10px 0;
        border-radius: 5px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .chatbot-section {
        position: fixed;
        bottom: 20px;
        right: 20px;
        width: 300px;
    }

    .chatbot-section textarea {
        resize: none;
    }

    a {
        color: #2980b9;
        text-decoration: none;
        font-weight: bold;
    }

    a:hover {
        text-decoration: underline;
    }

    .error {
        color: red;
        text-align: center;
    }
</style>
    
</head>
<body>
    <h2>Your Question:</h2>
    <p>${question}</p>

    <h2>AI Response:</h2>
    <p>${aiAnswer}</p>

    <br><a href="chatbox.jsp">Ask another question</a>
</body>
</html>
