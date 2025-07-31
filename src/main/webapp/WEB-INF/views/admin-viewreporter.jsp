<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.animal.model.Reporter" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>RescueNet | View Reporters</title>
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: url('https://hebbkx1anhila5yf.public.blob.vercel-storage.com/img-A4PWCpVlRRXqHWcWnMIxMAQitmlShW.webp') no-repeat center center fixed;
      background-size: cover;
      min-height: 100vh;
      position: relative;
      padding-top: 30px;
    }

    body::before {
      content: '';
      position: absolute;
      top: 0; left: 0; right: 0; bottom: 0;
      background-color: rgba(0, 0, 0, 0.6);
      z-index: -1;
    }

    h2 {
      text-align: center;
      color: #fff;
      font-size: 28px;
      text-shadow: 1px 1px 4px rgba(0,0,0,0.5);
    }

    table {
      width: 90%;
      max-width: 1000px;
      margin: 25px auto;
      border-collapse: collapse;
      backdrop-filter: blur(10px);
      background: rgba(255, 255, 255, 0.15);
      color: #fff;
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
    }

    th, td {
      padding: 12px 15px;
      text-align: center;
      border: 1px solid rgba(255, 255, 255, 0.2);
    }

    th {
      background-color: rgba(52, 152, 219, 0.8);
      color: #fff;
    }

    tr:nth-child(even) {
      background-color: rgba(255, 255, 255, 0.1);
    }

    tr:hover {
      background-color: rgba(255, 255, 255, 0.2);
    }

    .btn {
      display: inline-block;
      padding: 10px 20px;
      background-color: #3498db;
      color: white;
      text-decoration: none;
      border-radius: 8px;
      margin-top: 20px;
      font-weight: bold;
      transition: background-color 0.3s ease, transform 0.2s ease;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
    }

    .btn:hover {
      background-color: #2980b9;
      transform: translateY(-2px);
    }

    .center {
      text-align: center;
    }

    @media (max-width: 600px) {
      table, th, td {
        font-size: 14px;
      }

      h2 {
        font-size: 22px;
      }

      .btn {
        padding: 8px 16px;
        font-size: 14px;
      }
    }
  </style>
</head>
<body>
  <h2>Reporters List</h2>

  <table>
    <tr>
      <th>Contact</th>
      <th>Name</th>
      <th>Address</th>
      <th>Email</th>
    </tr>
    <%
      List<Reporter> reporters = (List<Reporter>) request.getAttribute("reporters");
      if (reporters != null && !reporters.isEmpty()) {
          for (Reporter r : reporters) {
    %>
    <tr>
      <td><%= r.getContact() %></td>
      <td><%= r.getName() %></td>
      <td><%= r.getAddress() %></td>
      <td><%= r.getEmail() %></td>
    </tr>
    <% 
          }
      } else { 
    %>
    <tr>
      <td colspan="4">No reporters found.</td>
    </tr>
    <% } %>
  </table>

  <div class="center">
    <a href="admin-dashboard" class="btn">Back to Dashboard</a>
  </div>
</body>
</html>
