<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>RescueNet | Admin Dashboard</title>
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
      backdrop-filter: blur(12px);
      -webkit-backdrop-filter: blur(12px);
      padding: 35px 30px;
      border-radius: 15px;
      box-shadow: 0 8px 24px rgba(0, 0, 0, 0.3);
      color: #fff;
      max-width: 400px;
      width: 90%;
      text-align: center;
    }

    h2 {
      margin-bottom: 25px;
      font-size: 28px;
      text-shadow: 1px 1px 4px rgba(0,0,0,0.4);
    }

    ul {
      list-style: none;
      padding-left: 0;
    }

    ul li {
      margin: 15px 0;
    }

    a {
      display: inline-block;
      font-size: 18px;
      color: #fff;
      background-color: #3498db;
      padding: 10px 20px;
      border-radius: 8px;
      text-decoration: none;
      transition: background-color 0.3s ease, transform 0.2s ease;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
    }

    a:hover {
      background-color: #2980b9;
      transform: translateY(-2px);
    }

    @media (max-width: 500px) {
      .dashboard {
        padding: 25px 20px;
      }

      h2 {
        font-size: 24px;
      }

      a {
        font-size: 16px;
        padding: 8px 16px;
      }
    }
  </style>
</head>
<body>
  <div class="dashboard">
    <h2>Admin Dashboard</h2>
    <ul>
      <li><a href="admin-manage">Manage Volunteers</a></li>
      <li><a href="admin-viewrescue">View Rescue Cases</a></li>
      <li><a href="admin-viewreporter">View Reporters</a></li>
    </ul>
  </div>
</body>
</html>
