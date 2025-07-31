<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.animal.model.RescueCase" %>
<%
    RescueCase caseObj = (RescueCase) request.getAttribute("case");
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>RescueNet | Check Case Status</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <style>
    body {
      margin: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: url('https://hebbkx1anhila5yf.public.blob.vercel-storage.com/img-A4PWCpVlRRXqHWcWnMIxMAQitmlShW.webp') no-repeat center center fixed;
      background-size: cover;
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
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

    h2 {
      color: #fff;
      font-size: 28px;
      margin-bottom: 20px;
      text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.4);
    }

    form {
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(10px);
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
      text-align: center;
      color: #fff;
      width: 90%;
      max-width: 400px;
    }

    input[type="text"] {
      width: 100%;
      padding: 12px;
      margin: 15px 0;
      border: none;
      border-radius: 8px;
      font-size: 16px;
      background: rgba(255,255,255,0.95);
      color: #333;
    }

    input[type="submit"] {
      width: 100%;
      padding: 12px;
      background-color: #3498db;
      color: #fff;
      border: none;
      border-radius: 8px;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
      background-color: #2980b9;
    }

    .case-info {
      margin-top: 30px;
      padding: 20px;
      width: 90%;
      max-width: 500px;
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(10px);
      border-radius: 12px;
      color: #fff;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
    }

    .case-info p {
      margin: 8px 0;
    }

    .btn {
      margin-top: 20px;
      display: inline-block;
      padding: 10px 20px;
      background-color: #27ae60;
      color: white;
      text-decoration: none;
      border-radius: 8px;
      font-weight: bold;
      transition: background-color 0.3s ease;
    }

    .btn:hover {
      background-color: #1e8449;
    }

    p.error {
      color: #ff4d4d;
      font-weight: bold;
      margin-top: 20px;
    }

    @media (max-width: 600px) {
      h2 {
        font-size: 22px;
      }
    }
  </style>
</head>
<body>

  <h2>Check Case Status</h2>

  <form method="get" action="reporter-caseStatus">
    <input type="text" name="caseId" placeholder="Enter Case ID" required />
    <input type="submit" value="Check Status" />
  </form>

  <%
    if (caseObj != null) {
  %>
    <div class="case-info">
      <h3>Case Details</h3>
      <p><strong>Case ID:</strong> <%= caseObj.getId() %></p>
      <p><strong>Animal Type:</strong> <%= caseObj.getAnimalType() %></p>
      <p><strong>Status:</strong> <%= caseObj.getStatus() %></p>
      <p><strong>Location:</strong> <%= caseObj.getLocation() %></p>
      <p><strong>Reported Date:</strong> <%= caseObj.getReportDate() %></p>
    </div>
  <%
    } else if (error != null) {
  %>
    <p class="error"><%= error %></p>
  <%
    }
  %>

  <a href="reporter-dashboard" class="btn">Back to Dashboard</a>

</body>
</html>
