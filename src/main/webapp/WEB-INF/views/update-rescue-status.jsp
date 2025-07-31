<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, com.animal.model.RescueCase" %>
<%
    List<RescueCase> rescueCases = (List<RescueCase>) request.getAttribute("rescueCases");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Rescue Status</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: url('https://hebbkx1anhila5yf.public.blob.vercel-storage.com/img-A4PWCpVlRRXqHWcWnMIxMAQitmlShW.webp') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
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

        h1 {
            margin-top: 40px;
            font-size: 2.5em;
            text-align: center;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.5);
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
            background-color: rgba(46, 204, 113, 0.85);
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.05);
        }

        button {
            padding: 8px 16px;
            background-color: #27ae60;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }

        button:hover {
            background-color: #1e8449;
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
            th, td {
                font-size: 14px;
                padding: 10px;
            }

            h1 {
                font-size: 2em;
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
    <h1>Update Rescue Status</h1>
    <table>
        <tr>
            <th>Case ID</th>
            <th>Reporter</th>
            <th>Animal Type</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <%
            if (rescueCases != null) {
                for (RescueCase rc : rescueCases) {
        %>
        <tr>
            <td><%= rc.getId() %></td>
            <td><%= rc.getReporterContact() %></td>
            <td><%= rc.getAnimalType() %></td>
            <td><%= rc.getStatus() %></td>
            <td>
                <% if (!"RescueCompleted".equalsIgnoreCase(rc.getStatus())) { %>
                <form action="mark-rescue-completed" method="post" style="display:inline;">
                    <input type="hidden" name="caseId" value="<%= rc.getId() %>" />
                    <button type="submit">Mark Completed</button>
                </form>
                <% } else { %>
                    ✅ Completed
                <% } %>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>
    <div class="back-link">
        <a href="volunteer-dashboard">Back to Dashboard</a>
    </div>
</body>
</html>
