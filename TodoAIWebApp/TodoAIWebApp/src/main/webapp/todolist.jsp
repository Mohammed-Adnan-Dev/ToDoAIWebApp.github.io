<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html> 
<html>
<head>
    <title>To-Do List</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: #2c3e50;
        }

        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
            position: relative;
            box-sizing: border-box;
        }

        h2, h3{
            color: #ffffff;
            text-align: center;
            margin-bottom: 25px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 2px;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        h4{
         color: purple;
            text-align: center;
            margin-bottom: 25px;
            font-weight: 600;
            font-size:20px;
            text-transform: uppercase;
            letter-spacing: 2px;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .task-form {
            background: rgba(255, 255, 255, 0.95);
            padding: 30px;
            margin: 20px auto;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            max-width: 600px;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
        }

        .task-form:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
        }

        .task-input {
            width: 100%;
            padding: 15px;
            margin-bottom: 20px;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            font-size: 16px;
            transition: all 0.3s ease;
            box-sizing: border-box;
            background: white;
        }

        .task-input:focus {
            border-color: #764ba2;
            outline: none;
            box-shadow: 0 0 0 3px rgba(118, 75, 162, 0.1);
        }

        .btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 15px 30px;
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

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(118, 75, 162, 0.4);
        }

        .btn-delete {
            background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
            padding: 10px 20px;
            font-size: 14px;
            width: auto;
            min-width: 100px;
        }

        .task-list {
            list-style: none;
            padding: 0;
            margin: 20px auto;
            max-width: 600px;
        }

        .task-item {
            background: rgba(255, 255, 255, 0.95);
            padding: 20px;
            margin: 15px 0;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            transition: all 0.3s ease;
            border-left: 4px solid #667eea;
        }

        .task-item:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        .task-content {
            flex: 1;
            min-width: 200px;
            padding-right: 20px;
        }

        .task-text {
            font-size: 16px;
            color: #2c3e50;
            margin-bottom: 8px;
            font-weight: 500;
        }

        .task-datetime {
            font-size: 13px;
            color: #7f8c8d;
            display: flex;
            align-items: center;
            gap: 5px;
            margin-top: 5px;
        }

        .datetime-icon {
            color: #95a5a6;
        }

        .chatbot-container {
            position: fixed;
            bottom: 30px;
            right: 30px;
            width: 350px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            padding: 25px;
            transition: all 0.3s ease;
            z-index: 1000;
            backdrop-filter: blur(10px);
        }

        .chatbot-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
        }

        .chatbot-input {
            width: 100%;
            padding: 15px;
            border: 2px solid #e0e0e0;
            border-radius: 10px;
            resize: none;
            margin-bottom: 15px;
            font-size: 14px;
            transition: all 0.3s ease;
            box-sizing: border-box;
            background: white;
        }

        .chatbot-input:focus {
            border-color: #764ba2;
            outline: none;
            box-shadow: 0 0 0 3px rgba(118, 75, 162, 0.1);
        }

        .chatbot-buttons {
            display: flex;
            gap: 10px;
        }

        .btn-suggest {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .btn-add-task {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }

            .chatbot-container {
                width: 90%;
                bottom: 20px;
                right: 50%;
                transform: translateX(50%);
                padding: 20px;
            }

            .chatbot-buttons {
                flex-direction: column;
            }

            .btn-suggest, 
            .btn-add-task {
                width: 100%;
                margin-bottom: 10px;
            }

            .task-item {
                flex-direction: column;
            }

            .task-content {
                margin-bottom: 15px;
                padding-right: 0;
            }

            .task-actions {
                width: 100%;
            }

            .btn-delete {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Todo List with AI</h2>

        <form action="todo" method="post" class="task-form">
            <input type="text" name="task" placeholder="Add a new task..." required class="task-input">
            <button type="submit" class="btn">Add Task</button>
        </form>

        <h3>Your Tasks</h3>
        <ul class="task-list">
            <c:forEach var="task" items="${tasks}">
                <li class="task-item">
                    <div class="task-content">
                        <div class="task-text">${task.task}</div>
                        <div class="task-datetime">
                            
                            <fmt:parseDate value="${task.createdAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
                            <span><fmt:formatDate value="${parsedDateTime}" pattern="MMM dd, yyyy HH:mm" /></span>
                        </div>
                    </div>
                    <div class="task-actions">
                        <form action="deleteTask" method="post" style="margin: 0;">
                            <input type="hidden" name="taskId" value="${task.id}">
                            <button type="submit" class="btn btn-delete">Delete</button>
                        </form>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </div>

    <div class="chatbot-container">
        <h4>AI Assistant</h4>
        <form action="chatbot" method="post">
            <textarea name="userInput" rows="4" placeholder="Example: Add 5 tasks for buying coffee" 
                required class="chatbot-input"></textarea>
            <div class="chatbot-buttons">
                <button type="submit" name="action" value="suggest" class="btn btn-suggest">Get Suggestion</button>
                <button type="submit" name="action" value="add" class="btn btn-add-task">Add Task</button>
            </div>
        </form>
    </div>
</body>
</html>