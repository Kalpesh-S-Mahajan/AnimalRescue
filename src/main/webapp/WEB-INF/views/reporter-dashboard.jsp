<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.animal.model.Reporter" %>
<%
    Reporter reporter = (Reporter) session.getAttribute("reporter");
    if (reporter == null) {
        response.sendRedirect("reporter-login-register");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reporter Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: url('https://hebbkx1anhila5yf.public.blob.vercel-storage.com/img-A4PWCpVlRRXqHWcWnMIxMAQitmlShW.webp') no-repeat center center fixed;
            background-size: cover;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            position: relative;
        }

        body::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0; bottom: 0;
            background-color: rgba(0, 0, 0, 0.6);
            z-index: -1;
        }

        .dashboard-box {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
            text-align: center;
            color: #fff;
            max-width: 500px;
            width: 90%;
        }

        h2 {
            margin-bottom: 30px;
            font-size: 26px;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.4);
        }

        .btn-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
        }

        .btn {
            background-color: #3498db;
            color: white;
            padding: 12px 22px;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }

        .btn:hover {
            background-color: #2980b9;
            transform: translateY(-2px);
        }

        @media (max-width: 500px) {
            .dashboard-box {
                padding: 30px 20px;
            }

            h2 {
                font-size: 22px;
            }

            .btn {
                width: 100%;
                font-size: 15px;
            }
        }
    </style>
</head>
<body>
    <div class="dashboard-box">
        <h2>Welcome, <%= reporter.getName() %>!</h2>
        <div class="btn-container">
            <a class="btn" href="reporter-viewRescueCases">View My Rescue Cases</a>
            <a class="btn" href="reporter-caseStatus">Check Case Status</a>
            <a class="btn" href="reporter-addRescueCase">Add New Rescue Case</a>
            <a class="btn" href="logoutReporter">Logout</a>
        </div>
    </div>
</body>
</html>
