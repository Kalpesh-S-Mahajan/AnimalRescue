<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>RescueNet Main Dashboard</title>
  <style>
      body {
          font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
          margin: 0;
          padding: 0;
          background-image: url('https://hebbkx1anhila5yf.public.blob.vercel-storage.com/img-A4PWCpVlRRXqHWcWnMIxMAQitmlShW.webp');
          background-size: cover; /* Ensures the image covers the entire background */
          background-position: center; /* Centers the background image */
          background-attachment: fixed; /* Makes the background image fixed when scrolling */
          display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;
          min-height: 100vh; /* Ensures the body takes at least the full viewport height */
          text-align: center;
          position: relative; /* Needed for the overlay */
          color: #fff; /* Default text color for better contrast */
      }

      /* Overlay to improve text readability over the background image */
      body::before {
          content: '';
          position: absolute;
          top: 0;
          left: 0;
          right: 0;
          bottom: 0;
          background-color: rgba(0, 0, 0, 0.6); /* Darker overlay for better contrast with new text */
          z-index: -1; /* Puts the overlay behind the content */
      }

      .main-content-wrapper {
          display: flex;
          flex-direction: column;
          align-items: center;
          justify-content: center;
          min-height: 100vh; /* Ensure wrapper takes full height to center content */
          width: 100%;
          padding: 20px;
          box-sizing: border-box;
      }

      .hero-section {
          margin-bottom: 40px;
          color: #ecf0f1;
          text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.6);
      }

      .hero-section h1 {
          font-size: 4em; /* Big title */
          margin-bottom: 15px;
          letter-spacing: 1px;
      }

      .hero-section p {
          font-size: 1.4em;
          max-width: 800px;
          margin: 0 auto;
          line-height: 1.5;
      }

      .dashboard-container {
          background-color: rgba(44, 62, 80, 0.85); /* Slightly less transparent dark background for the content */
          padding: 40px 30px;
          border-radius: 12px;
          box-shadow: 0 8px 20px rgba(0, 0, 0, 0.4);
          display: flex;
          flex-direction: column;
          gap: 25px;
          max-width: 400px;
          width: 90%;
          margin: 0 auto; /* Center the container */
          position: relative;
          z-index: 1; /* Ensures content is above the overlay */
      }

      .dashboard-container a {
          text-decoration: none;
          color: inherit; /* Inherit color from parent for consistency */
          display: block; /* Make the anchor tag a block to fill its container */
      }

      .dashboard-container a div {
          background-color: #3498db; /* Blue button background */
          color: #fff;
          padding: 18px 25px;
          border-radius: 8px;
          font-size: 1.5em;
          font-weight: bold;
          transition: background-color 0.3s ease, transform 0.2s ease;
          box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
      }

      .dashboard-container a div:hover {
          background-color: #2980b9; /* Darker blue on hover */
          transform: translateY(-3px);
          box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
      }

      /* Responsive adjustments */
      @media (max-width: 768px) {
          .hero-section h1 {
              font-size: 3em;
          }
          .hero-section p {
              font-size: 1.2em;
          }
          .dashboard-container {
              padding: 30px 20px;
              gap: 20px;
          }
          .dashboard-container a div {
              font-size: 1.3em;
              padding: 15px 20px;
          }
      }

      @media (max-width: 600px) {
          .hero-section h1 {
              font-size: 2.5em;
          }
          .hero-section p {
              font-size: 1em;
          }
          .dashboard-container {
              padding: 25px 15px;
              gap: 15px;
          }
          .dashboard-container a div {
              font-size: 1.1em;
              padding: 12px 18px;
          }
      }
  </style>
</head>
<body>
  <div class="main-content-wrapper">
    <div class="hero-section">
        <h1>RescueNet Animal Rescue</h1>
        <p>
            Dedicated to connecting volunteers, reporters, and administrators to efficiently manage and coordinate animal rescue operations. 
            Together, we can make a difference in the lives of animals in need.
        </p>
    </div>

    <div class="dashboard-container">
        <a href="admin-login">
            <div>Admin</div>
        </a>
        <a href="volunteer-login">
            <div>Volunteer</div>
        </a>
        <a href="reporter-login-register">
            <div>Reporter</div>
        </a>
    </div>
  </div>
</body>
</html>
