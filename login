<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Multi-Login System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        h1, h2 {
            color: #333;
            text-align: center;
        }
        /* Login Form Styles */
        .login-form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        /* Dashboard Styles */
        .dashboard-menu {
            display: grid;
            gap: 10px;
            margin: 20px 0;
        }
        .menu-item {
            background-color: #007bff;
            color: white;
            padding: 15px;
            border-radius: 4px;
            text-decoration: none;
            text-align: center;
            cursor: pointer;
        }
        .menu-item:hover {
            background-color: #0056b3;
        }
        .logout {
            background-color: #dc3545;
        }
        .logout:hover {
            background-color: #c82333;
        }
        /* Profile Styles */
        .profile-card {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 8px;
            margin-top: 20px;
        }
        .profile-field {
            margin: 10px 0;
            padding: 10px;
            border-left: 4px solid #007bff;
            background: white;
        }
        /* Bus Pass Booking Styles */
        .routes-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        .routes-table th, .routes-table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        .routes-table th {
            background-color: #f5f5f5;
        }
        .booking-form {
            display: none;
            background: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            margin-top: 20px;
        }
        .button {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            margin: 5px 0;
        }
        .button:hover {
            background-color: #218838;
        }
        .back-button {
            background-color: #6c757d;
        }
        .cancel-button {
            background-color: #dc3545;
        }
        /* Error Message */
        .error-message {
            color: #dc3545;
            text-align: center;
            margin: 10px 0;
        }
        /* Hide all sections initially */
        #loginSection, #studentDashboard, #operatorDashboard, #adminDashboard, 
        #profileSection, #busPassSection {
            display: none;
        }
    </style>
</head>
<body>
    <!-- Login Section -->
    <div id="loginSection" class="container">
        <div class="login-form">
            <h2>Login</h2>
            <form id="loginForm">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" required>
                </div>
                <div id="errorMessage" class="error-message"></div>
                <button type="submit" class="button">Login</button>
            </form>
        </div>
    </div>

    <!-- Student Dashboard -->
    <div id="studentDashboard" class="container">
        <h2>Student Dashboard</h2>
        <div class="dashboard-menu">
            <div class="menu-item" onclick="showSection('profileSection')">My Profile</div>
            <div class="menu-item" onclick="showSection('busPassSection')">Book Bus Pass</div>
            <div class="menu-item" onclick="showLiveLocation()">Live Location</div>
            <div class="menu-item" onclick="viewBookedPass()">View Booked Pass</div>
            <div class="menu-item logout" onclick="logout()">Logout</div>
        </div>
        <div id="locationDisplay"></div>
    </div>

    <!-- Profile Section -->
    <div id="profileSection" class="container">
        <h2>Student Profile</h2>
        <div class="profile-card">
            <div class="profile-field">
                <strong>Name:</strong> Anto Manuel
            </div>
            <div class="profile-field">
                <strong>Admission Number:</strong> SJC0000
            </div>
            <div class="profile-field">
                <strong>Course:</strong> B.Tech Computer Science
            </div>
            <div class="profile-field">
                <strong>Year:</strong> Third Year
            </div>
            <div class="profile-field">
                <strong>Blood Group:</strong> O-ve
            </div>
            <div class="profile-field">
                <strong>Contact:</strong> +91 9876543210
            </div>
            <div class="profile-field">
                <strong>Email:</strong> anto.manuel@example.com
            </div>
        </div>
        <button class="button back-button" onclick="showSection('studentDashboard')">Back to Dashboard</button>
    </div>

    <!-- Bus Pass Section -->
    <div id="busPassSection" class="container">
        <h2>Book Bus Pass</h2>
        <table class="routes-table">
            <thead>
                <tr>
                    <th>Route</th>
                    <th>Departure Time</th>
                    <th>Stops</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Route A</td>
                    <td>8:00 AM</td>
                    <td>Pala, Kuravilangad, Ettumanoor</td>
                    <td><button class="button" onclick="showBookingForm('Route A', '8:00 AM', 'Pala, Kuravilangad, Ettumanoor')">Select</button></td>
                </tr>
                <tr>
                    <td>Route B</td>
                    <td>9:00 AM</td>
                    <td>Kottayam, Kumarakom, Changanassery</td>
                    <td><button class="button" onclick="showBookingForm('Route B', '9:00 AM', 'Kottayam, Kumarakom, Changanassery')">Select</button></td>
                </tr>
                <tr>
                    <td>Route C</td>
                    <td>7:30 AM</td>
                    <td>Thodupuzha, Muttom, Kaduthuruthy</td>
                    <td><button class="button" onclick="showBookingForm('Route C', '7:30 AM', 'Thodupuzha, Muttom, Kaduthuruthy')">Select</button></td>
                </tr>
            </tbody>
        </table>

        <div id="bookingForm" class="booking-form">
            <h3>Complete Your Booking</h3>
            <div class="form-group">
                <label>Selected Route:</label>
                <input type="text" id="selectedRoute" readonly>
            </div>
            <div class="form-group">
                <label>Departure Time:</label>
                <input type="text" id="departureTime" readonly>
            </div>
            <div class="form-group">
                <label>Select Boarding Point:</label>
                <select id="boardingPoint"></select>
            </div>
            <div class="form-group">
                <label>Pass Duration:</label>
                <select id="passDuration">
                    <option value="1">1 Month - ₹1000</option>
                    <option value="3">3 Months - ₹2700</option>
                    <option value="6">6 Months - ₹5000</option>
                </select>
            </div>
            <button class="button" onclick="confirmBooking()">Confirm Booking</button>
            <button class="button cancel-button" onclick="cancelBooking()">Cancel</button>
        </div>
        <button class="button back-button" onclick="showSection('studentDashboard')">Back to Dashboard</button>
    </div>

    <!-- Operator Dashboard -->
    <div id="operatorDashboard" class="container">
        <h2>Operator Dashboard</h2>
        <div class="dashboard-menu">
            <div class="menu-item">Operator Profile</div>
            <div class="menu-item">List of Students</div>
            <div class="menu-item">Bus Pass Management</div>
            <div class="menu-item">Emergency Alerts</div>
            <div class="menu-item logout" onclick="logout()">Logout</div>
        </div>
    </div>

    <!-- Admin Dashboard -->
    <div id="adminDashboard" class="container">
        <h2>Admin Dashboard</h2>
        <div class="dashboard-menu">
            <div class="menu-item">Manage Users</div>
            <div class="menu-item">System Settings</div>
            <div class="menu-item">View Reports</div>
            <div class="menu-item logout" onclick="logout()">Logout</div>
        </div>
    </div>

    <script>
        // Show login section on page load
        window.onload = function() {
            checkLoginStatus();
        };

        // Check login status
        function checkLoginStatus() {
            const role = localStorage.getItem('role');
            if (role) {
                showSection(role + 'Dashboard');
            } else {
                showSection('loginSection');
            }
        }

        // Show/hide sections
        function showSection(sectionId) {
            // Hide all sections
            document.querySelectorAll('.container').forEach(container => {
                container.style.display = 'none';
            });
            // Show requested section
            document.getElementById(sectionId).style.display = 'block';
        }

        // Login form handler
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            e.preventDefault();
            const username = document.getElementById('username').value;
            const password = document.getElementById('password').value;
            
            if (username === 'student' && password === 'student123') {
                localStorage.setItem('role', 'student');
                showSection('studentDashboard');
            } else if (username === 'operator' && password === 'operator123') {
                localStorage.setItem('role', 'operator');
                showSection('operatorDashboard');
            } else if (username === 'admin' && password === 'admin123') {
                localStorage.setItem('role', 'admin');
                showSection('adminDashboard');
            } else {
                document.getElementById('errorMessage').textContent = 'Invalid username or password';
            }
        });

        // Logout function
        function logout() {
            localStorage.removeItem('role');
            showSection('loginSection');
        }

        // Live location function
        function showLiveLocation() {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function(position) {
                    const locationDisplay = document.getElementById('locationDisplay');
                    locationDisplay.innerHTML = `
                        <div class="profile-card">
                            <strong>Your Current Location:</strong><br>
                            Latitude: ${position.coords.latitude}<br>
                            Longitude: ${position.coords.longitude}
                        </div>
                    `;
                    locationDisplay.style.display = 'block';
                });
            } else {
                alert('Geolocation is not supported by this browser.');
            }
        }

        // Bus pass booking functions
        function showBookingForm(route, time, stops) {
            const bookingForm = document.getElementById('bookingForm');
            bookingForm.style.display = 'block';
            
            document.getElementById('selectedRoute').value = route;
            document.getElementById('departureTime').value = time;
            
            // Populate boarding points
            const boardingPoint = document.getElementById('boardingPoint');
            boardingPoint.innerHTML = '';
            stops.split(', ').forEach(stop => {
                const option = document.createElement('option');
                option.value = stop;
                option.textContent = stop;
                boardingPoint.appendChild(option);
            });
            
            bookingForm.scrollIntoView({ behavior: 'smooth' });
        }

        function confirmBooking() {
            const booking = {
                route: document.getElementById('selectedRoute').value,
                departureTime: document.getElementById('departureTime').value,
                boardingPoint: document.getElementById('boardingPoint').value,
                duration: document.getElementById('passDuration').value,
                bookingDate: new Date().toLocaleDateString()
            };
            
            localStorage.setItem('busPass', JSON.stringify(booking));
            alert('Bus pass booked successfully!');
            showSection('studentDashboard');
        }

        function cancelBooking() {
            document.getElementById('bookingForm').style.display = 'none';
        }

        function viewBookedPass() {
            const booking = JSON.parse(localStorage.getItem('busPass'));
            if (booking) {
                alert(Current Active Pass:\nRoute: ${booking.route}\nBoarding Point: ${booking.boardingPoint}\nDuration: ${booking.duration} month(s)\nBooked on: ${booking.bookingDate});
            } else {
                alert('No active bus pass found.');
            }
        }
    </script>
</body>
</html>
