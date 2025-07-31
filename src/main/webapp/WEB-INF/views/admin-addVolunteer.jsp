<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>RescueNet | Contact Form</title>
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

    form {
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(10px);
      -webkit-backdrop-filter: blur(10px);
      padding: 30px 25px;
      border-radius: 15px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
      color: #fff;
      width: 90%;
      max-width: 400px;
    }

    h2 {
      text-align: center;
      margin-bottom: 25px;
      font-size: 28px;
      text-shadow: 1px 1px 3px rgba(0,0,0,0.4);
    }

    label {
      display: block;
      margin-bottom: 6px;
      font-weight: bold;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: none;
      border-radius: 8px;
      background-color: rgba(255, 255, 255, 0.9);
      color: #333;
      font-size: 15px;
    }

    button {
      width: 100%;
      padding: 12px;
      background: #3498db;
      color: white;
      border: none;
      border-radius: 8px;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
      transition: background-color 0.3s ease, transform 0.2s ease;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
    }

    button:hover {
      background: #2980b9;
      transform: translateY(-2px);
    }

    @media (max-width: 500px) {
      form {
        padding: 25px 20px;
      }

      h2 {
        font-size: 22px;
      }

      button {
        font-size: 15px;
      }
    }
  </style>
</head>
<body>
  <form action="registervolunteer" method="POST">
    <h2>Contact Form</h2>

    <label for="contact">Contact (Primary Key):</label>
    <input type="text" id="contact" name="contact" required>

    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required>

    <label for="zone">Zone:</label>
    <input type="text" id="zone" name="zone" required>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required>

    <button type="submit">Submit</button>
  </form>
</body>
</html>
