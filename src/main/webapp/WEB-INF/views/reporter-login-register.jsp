<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Reporter Auth | RescueNet</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      margin: 0;
      background: url('https://hebbkx1anhila5yf.public.blob.vercel-storage.com/img-A4PWCpVlRRXqHWcWnMIxMAQitmlShW.webp') no-repeat center center fixed;
      background-size: cover;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      position: relative;
    }

    body::before {
      content: '';
      position: absolute;
      top: 0; left: 0; right: 0; bottom: 0;
      background-color: rgba(0, 0, 0, 0.6);
      z-index: -1;
    }

    .container {
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(12px);
      padding: 30px;
      border-radius: 16px;
      box-shadow: 0 8px 25px rgba(0, 0, 0, 0.4);
      width: 90%;
      max-width: 420px;
      color: #fff;
    }

    h2 {
      text-align: center;
      margin-bottom: 25px;
      font-size: 26px;
      text-shadow: 1px 1px 3px rgba(0,0,0,0.4);
    }

    .tabs {
      display: flex;
      justify-content: space-between;
      margin-bottom: 20px;
    }

    .tabs button {
      flex: 1;
      margin: 0 5px;
      padding: 10px;
      font-size: 16px;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      background: rgba(255, 255, 255, 0.2);
      color: #fff;
      transition: background 0.3s ease;
    }

    .tabs button.active {
      background: #3498db;
    }

    form {
      display: none;
      flex-direction: column;
    }

    form.active {
      display: flex;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
      padding: 12px;
      margin: 8px 0;
      border: none;
      border-radius: 8px;
      font-size: 15px;
      background: rgba(255, 255, 255, 0.9);
      color: #333;
    }

    input[type="submit"] {
      background-color: #27ae60;
      color: white;
      border: none;
      padding: 12px;
      border-radius: 8px;
      font-size: 16px;
      cursor: pointer;
      margin-top: 10px;
      transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
      background-color: #219150;
    }

    @media (max-width: 500px) {
      h2 {
        font-size: 22px;
      }
    }
  </style>
  <script>
    function showForm(formId, btn) {
      document.getElementById('registerForm').classList.remove('active');
      document.getElementById('loginForm').classList.remove('active');
      document.getElementById(formId).classList.add('active');

      document.getElementById('regBtn').classList.remove('active');
      document.getElementById('logBtn').classList.remove('active');
      btn.classList.add('active');
    }

    // Default to Register Form
    window.onload = function () {
      document.getElementById('registerForm').classList.add('active');
      document.getElementById('regBtn').classList.add('active');
    }
  </script>
</head>
<body>

<div class="container">
  <h2>Reporter Portal</h2>

  <div class="tabs">
    <button id="regBtn" onclick="showForm('registerForm', this)">Register</button>
    <button id="logBtn" onclick="showForm('loginForm', this)">Login</button>
  </div>

  <!-- Registration Form -->
  <form id="registerForm" action="registerReporter" method="post">
    <input type="text" name="contact" placeholder="Contact (ID)" required>
    <input type="text" name="name" placeholder="Name" required>
    <input type="text" name="address" placeholder="Address" required>
    <input type="email" name="email" placeholder="Email" required>
    <input type="password" name="password" placeholder="Password" required>
    <input type="submit" value="Register">
  </form>

  <!-- Login Form -->
  <form id="loginForm" action="loginReporter" method="post">
    <input type="text" name="contact" placeholder="Contact (ID)" required>
    <input type="password" name="password" placeholder="Password" required>
    <input type="submit" value="Login">
  </form>
</div>

</body>
</html>
