<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.animal.model.RescueCase" %>
<%
    List<RescueCase> rescueCases = (List<RescueCase>) request.getAttribute("rescueCases");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Rescue Cases by Reporter</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: url('https://hebbkx1anhila5yf.public.blob.vercel-storage.com/img-A4PWCpVlRRXqHWcWnMIxMAQitmlShW.webp') no-repeat center center fixed;
            background-size: cover;
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            position: relative;
        }

        body::before {
            content: "";
            position: absolute;
            inset: 0;
            background-color: rgba(0, 0, 0, 0.6);
            z-index: -1;
        }

        h1 {
            margin-top: 40px;
            text-align: center;
            font-size: 2.5em;
            text-shadow: 1px 1px 5px rgba(0,0,0,0.5);
        }

        table {
            width: 90%;
            max-width: 1000px;
            margin: 30px auto;
            border-collapse: collapse;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0,0,0,0.4);
        }

        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid rgba(255,255,255,0.2);
            color: #fff;
        }

        th {
            background-color: rgba(52, 152, 219, 0.9);
        }

        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.05);
        }

        .back-link {
            margin: 30px auto;
            text-align: center;
        }

        .back-link a {
            padding: 12px 24px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            font-size: 16px;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        .back-link a:hover {
            background-color: #2980b9;
        }

        @media (max-width: 768px) {
            table, th, td {
                font-size: 14px;
                padding: 10px;
            }
            h1 {
                font-size: 2em;
            }
        }
    </style>
</head>
<body>
    <h1>Rescue Cases by Reporter</h1>
    <table>
        <thead>
            <tr>
                <th>Case ID</th>
                <th>Reporter</th>
                <th>Animal Type</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <%
                if (rescueCases != null && !rescueCases.isEmpty()) {
                    for (RescueCase rc : rescueCases) {
            %>
            <tr>
                <td><%= rc.getId() %></td>
                <td><%= rc.getReporterContact() %></td>
                <td><%= rc.getAnimalType() %></td>
                <td><%= rc.getStatus() %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr><td colspan="4">No rescue cases found.</td></tr>
            <%
                }
            %>
        </tbody>
    </table>

    <div class="back-link">
        <a href="volunteer-dashboard">Back to Dashboard</a>
    </div>
</body>
</html>
