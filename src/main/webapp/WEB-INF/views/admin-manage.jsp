<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>RescueNet | Manage Volunteers</title>
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
      position: relative;
    }

    body::before {
      content: '';
      position: absolute;
      top: 0; left: 0; right: 0; bottom: 0;
      background-color: rgba(0, 0, 0, 0.6);
      z-index: -1;
    }

    .dashboard {
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(10px);
      -webkit-backdrop-filter: blur(10px);
      padding: 35px 30px;
      border-radius: 15px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
      max-width: 400px;
      width: 90%;
      text-align: center;
      color: #fff;
    }

    h2 {
      margin-bottom: 25px;
      font-size: 26px;
      text-shadow: 1px 1px 4px rgba(0,0,0,0.4);
    }

    a {
      text-decoration: none;
      display: block;
      margin: 15px 0;
    }

    a div {
      background-color: #3498db;
      padding: 12px;
      border-radius: 8px;
      font-size: 18px;
      font-weight: bold;
      color: #fff;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
      transition: background-color 0.3s ease, transform 0.2s ease;
    }

    a div:hover {
      background-color: #2980b9;
      transform: translateY(-2px);
    }

    @media (max-width: 500px) {
      .dashboard {
        padding: 25px 20px;
      }

      a div {
        font-size: 16px;
        padding: 10px;
      }
    }
  </style>
</head>
<body>

  <div class="dashboard">
    <h2>Manage Volunteers</h2>

    <a href="admin-addVolunteer">
      <div>Add Volunteer</div>
    </a>

    <a href="admin-viewVolunteer">
      <div>View Volunteers</div>
    </a>
  </div>

</body>
</html>
