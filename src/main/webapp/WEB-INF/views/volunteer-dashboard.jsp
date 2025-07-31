<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.animal.model.Volunteer" %>
<%
    Volunteer volunteer = (Volunteer) session.getAttribute("volunteer");
    if (volunteer == null) {
        response.sendRedirect("volunteer-login");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Volunteer Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: url('https://hebbkx1anhila5yf.public.blob.vercel-storage.com/img-A4PWCpVlRRXqHWcWnMIxMAQitmlShW.webp') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            position: relative;
            color: #fff;
        }

        body::before {
            content: "";
            position: absolute;
            inset: 0;
            background-color: rgba(0, 0, 0, 0.6);
            z-index: -1;
        }

        .container {
            margin-top: 80px;
            background: rgba(255, 255, 255, 0.08);
            padding: 40px 30px;
            border-radius: 15px;
            backdrop-filter: blur(10px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
            text-align: center;
            width: 90%;
            max-width: 700px;
        }

        h1 {
            font-size: 2.5em;
            margin-bottom: 15px;
            text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.5);
        }

        .welcome {
            font-size: 1.2em;
            margin-bottom: 30px;
        }

        .options {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .options a {
            display: block;
            padding: 15px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            font-weight: bold;
            border-radius: 10px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .options a:hover {
            background-color: #2980b9;
            transform: translateY(-3px);
        }

        .logout {
            margin-top: 30px;
        }

        .logout a {
            color: #e74c3c;
            font-weight: bold;
            text-decoration: none;
        }

        .logout a:hover {
            text-decoration: underline;
        }

        @media (max-width: 600px) {
            h1 {
                font-size: 2em;
            }
            .welcome {
                font-size: 1em;
            }
            .container {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Volunteer Dashboard</h1>
        <div class="welcome">
            Welcome, <b><%= volunteer.getName() %></b> (Zone: <%= volunteer.getZone() %>)
        </div>
        <div class="options">
            <a href="view-rescue-cases">View Rescue Cases by Reporter</a>
            <a href="update-rescue-status">Update Case Status (Rescue Completed)</a>
        </div>
        <div class="logout">
            <a href="volunteer-logout">Logout</a>
        </div>
    </div>
</body>
</html>
