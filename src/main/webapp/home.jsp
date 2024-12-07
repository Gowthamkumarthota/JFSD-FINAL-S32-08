<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>GeniusTrack - Empowering Your Journey</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    
	<script>
        // Display the alert message if available
        window.onload = function () {
            var alertMessage = '<%= request.getAttribute("alertMessage") != null ? request.getAttribute("alertMessage") : "" %>';
            if (alertMessage) {
                alert(alertMessage);
            }
        };
    </script>
    
    
</head>
<body>
    <!-- Navigation Bar 	-->
    <nav class="navbar">
        <div class="nav-brand">
            <h1>GeniusTrack</h1>
        </div>
        <div class="nav-links">
            <a href="/">Home</a>
            <a href="#features">Features</a>
            <a href="#about">About</a>
            <label for="modal-signup" class="btn btn-primary">Sign Up</label>
            <label for="modal-signin" class="btn btn-secondary">Sign In</label>
        </div>
    </nav>

    <!-- Hero Section -->
    <header class="hero">
        <div class="hero-content">
            <h1>Welcome to GeniusTrack</h1>
            <p>Unlock your potential and track your progress with our innovative platform</p>
            <label for="modal-signup" class="btn btn-large">Get Started</label>
        </div>
        <section class="features">
    <h2>Why Choose GeniusTrack?</h2>
    <p>Discover the powerful features of our platform designed to help educators and students alike.</p>

    <div class="feature-cards">
        <div class="feature-card">
            <div class="card-icon">
                <i class="fas fa-chart-line"></i>
            </div>
            <h3>Comprehensive Analytics</h3>
            <p>Track student performance with detailed reports and visual analytics on marks, attendance, and feedback.</p>
        </div>
        <div class="feature-card">
            <div class="card-icon">
                <i class="fas fa-users"></i>
            </div>
            <h3>Teacher and Student Dashboards</h3>
            <p>Both teachers and students can easily access personalized dashboards to manage and review data.</p>
        </div>
        <div class="feature-card">
            <div class="card-icon">
                <i class="fas fa-comments"></i>
            </div>
            <h3>Feedback System</h3>
            <p>Teachers can provide valuable feedback to students, helping them improve and excel in their studies.</p>
        </div>
        <div class="feature-card">
            <div class="card-icon">
                <i class="fas fa-sync-alt"></i>
            </div>
            <h3>Real-Time Updates</h3>
            <p>Stay up to date with real-time updates on student data, ensuring accurate and timely performance tracking.</p>
        </div>
    </div>
</section>
        
    </header>

    <!-- Sign Up Modal -->
    <input type="checkbox" id="modal-signup" class="modal-toggle">
    <div class="modal">
        <div class="modal-content">
            <h2>Sign Up</h2>
            <form action="insertstudent" method="POST">
                <div class="form-group">
                    <label for="signup-name">Full Name</label>
                    <input type="text" id="sname" name="sname" required>
                </div>
                <div class="form-group">
                    <label for="Gender">Gender</label>
                    <input type="text" id="sgender" name="sgender" required>
                </div>
                <div class="form-group">
                    <label for="signup-email">Email</label>
                    <input type="email" id="semail" name="semail" required>
                </div>
                <div class="form-group">
                    <label for="Phone">Contact</label>
                    <input type="text" id="sphone" name="sphone" required>
                </div>
                
                <div class="form-group">
                    <label for="dob">DOB</label>
                    <input type="date" id="sdob" name="sdob" required>
                </div>
                <div class="form-group">
                    <label for="signup-password">Password</label>
                    <input type="password" id="spwd" name="spwd" required>
                </div>
                <button type="submit" class="btn btn-primary">Create Account</button>
            </form>
            
            <label for="modal-signup" class="modal-close">&times;</label>
        </div>
    </div>

    <!-- Sign In Modal -->
    <input type="checkbox" id="modal-signin" class="modal-toggle">
    <div class="modal">
        <div class="modal-content">
            <h2>Sign In</h2>
           <form action="checklogin" method="POST">
    <div class="form-group">
        <label for="signin-email">Email</label>
        <input type="email" id="semail" name="semail" required>
    </div>
    <div class="form-group">
        <label for="signin-password">Password</label>
        <input type="password" id="spwd" name="spwd" required>
    </div>
    <button type="submit" class="btn btn-primary">Sign In</button>
</form>


            <label for="modal-signin" class="modal-close">&times;</label>
        </div>
    </div>

    <!-- Features Section -->
    <section id="features" class="features">
        <h2>Our Features</h2>
        <div class="feature-grid">
            <div class="feature-card">
                <h3>Smart Tracking</h3>
                <p>Monitor your progress with intelligent analytics</p>
            </div>
            <div class="feature-card">
                <h3>Personalized Learning</h3>
                <p>Customized paths for your unique journey</p>
            </div>
            <div class="feature-card">
                <h3>Real-time Insights</h3>
                <p>Get instant feedback on your performance</p>
            </div>
        </div>
    </section>
    
<section id="about" class="about">
   <center> <h2 >About Genius Track</h2></center>
    <div class="feature-grid">
        <div class="feature-card">
            <h3>Our Mission</h3>
            <p>To simplify and enhance the way you track, learn, and grow in your journey.</p>
        </div>
        <div class="feature-card">
            <h3>Our Vision</h3>
            <p>To be the leading platform in intelligent performance tracking and personalized development.</p>
        </div>
        <div class="feature-card">
            <h3>Core Values</h3>
            <p>Innovation, adaptability, and a commitment to excellence in everything we deliver.</p>
        </div>
    </div>
</section>


    <!-- Footer -->
    <footer class="footer">
        <div class="footer-content">
            <div class="footer-section">
                <h3>GeniusTrack</h3>
                <p>Empowering learners worldwide</p>
            </div>
            <div class="footer-section">
                <h3>Quick Links</h3>
                <a href="/">Home</a>
                <a href="#features">Features</a>
                <a href="#about">About</a>
            </div>
            <div class="footer-section">
                <h3>Contact</h3>
                <p>Email: info@geniustrack.com</p>
                <p>Phone: (555) 123-4567</p>
            </div>
        </div>
        

        <div class="footer-bottom">
            <p>&copy; 2024 GeniusTrack. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>