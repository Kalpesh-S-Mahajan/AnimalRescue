<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.animal.model.RescueCase" %>
<%
    List<RescueCase> cases = (List<RescueCase>) request.getAttribute("cases");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Rescue Cases</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: url('https://hebbkx1anhila5yf.public.blob.vercel-storage.com/img-A4PWCpVlRRXqHWcWnMIxMAQitmlShW.webp') no-repeat center center fixed;
            background-size: cover;
            color: #fff;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            position: relative;
        }

        body::before {
            content: "";
            position: absolute;
            inset: 0;
            background-color: rgba(0, 0, 0, 0.6);
            z-index: -1;
        }

        h2 {
            margin-top: 40px;
            font-size: 2em;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.4);
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
            color: #fff;
            border-bottom: 1px solid rgba(255,255,255,0.2);
        }

        th {
            background-color: rgba(52, 152, 219, 0.8);
            font-weight: 600;
        }

        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.05);
        }

        .back-btn {
            margin: 30px auto;
            text-align: center;
        }

        .btn {
            padding: 12px 24px;
            background-color: #3498db;
            color: white;
            text-decoration: none;
            font-size: 16px;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #2980b9;
        }

        @media (max-width: 768px) {
            th, td {
                font-size: 14px;
                padding: 10px;
            }
        }

        @media (max-width: 500px) {
            table {
                width: 95%;
            }
        }
    </style>
</head>
<body>
    <h2>My Rescue Cases</h2>

    <table>
        <thead>
            <tr>
                <th>Case ID</th>
                <th>Animal Type</th>
                <th>Location</th>
                <th>Description</th>
                <th>Report Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
            <%
                if (cases != null && !cases.isEmpty()) {
                    for (RescueCase c : cases) {
            %>
                <tr>
                    <td><%= c.getId() %></td>
                    <td><%= c.getAnimalType() %></td>
                    <td><%= c.getLocation() %></td>
                    <td><%= c.getDescription() %></td>
                    <td><%= c.getReportDate() %></td>
                    <td><%= c.getStatus() %></td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr>
                    <td colspan="6">No rescue cases found.</td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>

    <div class="back-btn">
        <a href="reporter-dashboard" class="btn">Back to Dashboard</a>
    </div>
</body>
</html>
