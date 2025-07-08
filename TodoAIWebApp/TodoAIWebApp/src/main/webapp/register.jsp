<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <style>
    body {
        margin: 0;
        padding: 0;
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    }

    .login-container {
        background: rgba(255, 255, 255, 0.95);
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        width: 90%;
        max-width: 400px;
        margin: 20px;
        backdrop-filter: blur(10px);
        transform: translateY(0);
        transition: all 0.3s ease;
        box-sizing: border-box;
    }

     @media (max-width: 480px) {
        .login-container {
            margin: 10px;
            padding: 30px;
        }
    }

    .login-container:hover {
        transform: translateY(-5px);
        box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
    }

    h2 {
        color: #2c3e50;
        text-align: center;
        margin-bottom: 30px;
        font-size: 2em;
        font-weight: 600;
        position: relative;
    }

    h2:after {
        content: '';
        display: block;
        width: 60px;
        height: 3px;
        background: #764ba2;
        margin: 10px auto;
        border-radius: 3px;
    }

    .form-group {
        margin-bottom: 25px;
    }

    label {
        display: block;
        margin-bottom: 8px;
        color: #2c3e50;
        font-weight: 500;
        font-size: 0.9em;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 15px;
        border: 2px solid #e0e0e0;
        border-radius: 10px;
        font-size: 16px;
        transition: all 0.3s ease;
        box-sizing: border-box;
        background: white;
    }

    input[type="text"]:focus,
    input[type="password"]:focus {
        border-color: #764ba2;
        outline: none;
        box-shadow: 0 0 0 3px rgba(118, 75, 162, 0.1);
    }

    .submit-btn {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        padding: 15px;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        font-size: 16px;
        font-weight: 600;
        width: 100%;
        transition: all 0.3s ease;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    .submit-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(118, 75, 162, 0.4);
    }

    .register-link {
        text-align: center;
        margin-top: 20px;
    }

    a {
        color: #764ba2;
        text-decoration: none;
        font-weight: 600;
        transition: all 0.3s ease;
    }

    a:hover {
        color: #667eea;
        text-decoration: underline;
    }

    .error {
        color: #e74c3c;
        text-align: center;
        padding: 10px;
        margin-top: 10px;
        border-radius: 5px;
        font-size: 14px;
        background: rgba(231, 76, 60, 0.1);
    }

     .login-container {
        background: rgba(255, 255, 255, 0.95);
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        width: 100%;
        max-width: 400px;
    }

    h2:after {
        background: #667eea; /* Different color for register page */
    }

    .submit-btn {
        background: linear-gradient(135deg, #764ba2 0%, #667eea 100%); /* Reversed gradient */
    }

    .login-link {
        text-align: center;
        margin-top: 20px;
    }
</style>
    
    
</head>
<body>
    <div class="login-container">
        <h2>Create Account</h2>
        <form action="register" method="post">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" name="username" id="username" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" required>
            </div>

            <button type="submit" class="submit-btn">Register</button>
        </form>

        <div class="login-link">
            <p>Already have an account? <a href="login.jsp">Login here</a></p>
        </div>
    </div>
</body>
</html>
