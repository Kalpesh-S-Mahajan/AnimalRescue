<%@ page import="com.animal.model.Volunteer" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>RescueNet | Volunteer List</title>
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
            margin-bottom: 20px;
        }

        table {
            width: 90%;
            max-width: 1100px;
            margin: 0 auto 30px;
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
            background-color: rgba(155, 89, 182, 0.9);
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.1);
        }

        tr:hover {
            background-color: rgba(255, 255, 255, 0.2);
        }

        a.delete-btn {
            color: #fff;
            background-color: #e74c3c;
            padding: 6px 12px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
            display: inline-block;
        }

        a.delete-btn:hover {
            background-color: #c0392b;
            transform: scale(1.05);
        }

        @media (max-width: 600px) {
            table, th, td {
                font-size: 14px;
            }

            h2 {
                font-size: 22px;
            }

            a.delete-btn {
                padding: 5px 10px;
                font-size: 13px;
            }
        }
    </style>
</head>
<body>

    <h2>Volunteer List</h2>

    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Contact</th>
                <th>Zone</th>
                <th>Email</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Volunteer> volunteers = (List<Volunteer>) request.getAttribute("volunteers");
                if (volunteers != null && !volunteers.isEmpty()) {
                    for (Volunteer v : volunteers) {
            %>
            <tr>
                <td><%= v.getName() %></td>
                <td><%= v.getContact() %></td>
                <td><%= v.getZone() %></td>
                <td><%= v.getEmail() %></td>
                <td><a href="deleteVolunteer?contact=<%= v.getContact() %>" class="delete-btn">Delete</a></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="5">No volunteers found.</td>
            </tr>
            <% } %>
        </tbody>
    </table>

</body>
</html>
