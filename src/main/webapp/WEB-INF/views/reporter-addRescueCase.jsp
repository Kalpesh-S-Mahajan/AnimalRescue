<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>RescueNet | Add Rescue Case</title>
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
      position: relative;
    }

    body::before {
      content: '';
      position: absolute;
      top: 0; left: 0; right: 0; bottom: 0;
      background-color: rgba(0, 0, 0, 0.6);
      z-index: -1;
    }

    .form-container {
      background: rgba(255, 255, 255, 0.1);
      backdrop-filter: blur(10px);
      -webkit-backdrop-filter: blur(10px);
      padding: 35px 30px;
      border-radius: 15px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
      width: 90%;
      max-width: 400px;
      color: #fff;
      text-align: center;
    }

    h2 {
      margin-bottom: 25px;
      font-size: 26px;
      color: #fff;
      text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.4);
    }

    input, textarea {
      width: 100%;
      padding: 10px;
      margin-bottom: 15px;
      border: none;
      border-radius: 8px;
      font-size: 15px;
      background-color: rgba(255, 255, 255, 0.9);
      color: #333;
      resize: none;
    }

    textarea {
      height: 80px;
    }

    button {
      width: 100%;
      padding: 12px;
      background-color: #2ecc71;
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
      background-color: #27ae60;
      transform: translateY(-2px);
    }

    a {
      display: inline-block;
      margin-top: 20px;
      color: #3498db;
      font-weight: bold;
      text-decoration: none;
    }

    a:hover {
      text-decoration: underline;
    }

    @media (max-width: 500px) {
      .form-container {
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
  <div class="form-container">
    <h2>Add Animal Rescue Case</h2>
    <form action="saveRescueCase" method="post">
      <input type="text" name="animalType" placeholder="Animal Type" required>
      <input type="text" name="location" placeholder="Location" required>
      <textarea name="description" placeholder="Description"></textarea>
      <input type="text" name="reportDate" placeholder="YYYY-MM-DD HH:MM:SS" required>
      <button type="submit">Save Rescue Case</button>
    </form>
    <a href="reporter-viewRescueCases">View My Cases</a>
  </div>
</body>
</html>
