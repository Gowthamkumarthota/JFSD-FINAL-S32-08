
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    
    
    <style>
    * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
        /* Navigation Bar */
.navbar {
    background-color: black;
    padding: 1rem 5%;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    position: fixed;
    width: 100%;
    top: 0;
    z-index: 1000;
}

.nav-brand h1 {
    color: #ffffff;
    font-size: 1.8rem;
    font-weight: 700;
}

.nav-links {
    display: flex;
    gap: 2rem;
    align-items: center;
}

.nav-links a {
    text-decoration: none;
    color: #FFFFFF;
    font-weight: 500;
    transition: color 0.3s ease;
}

.nav-links a:hover {
    color: #FFFFFF;
}

/* Button Styles */
.btn {
    padding: 0.8rem 1.5rem;
    border-radius: 5px;
    cursor: pointer;
    font-weight: 600;
    transition: all 0.3s ease;
    text-decoration: none;
}

.btn-primary {
    background-color: #3498db;
    color: white;
    border: none;
}

.btn-primary:hover {
    background-color: #2980b9;
}

.btn-secondary {
    background-color: transparent;
    color: #3498db;
    border: 2px solid #3498db;
}

.btn-secondary:hover {
    background-color: #3498db;
    color: white;
}

.btn-large {
    padding: 1rem 2rem;
    font-size: 1.1rem;
}
    </style>
</head>

<body>
    <!-- Navbar -->
     <nav class="navbar">
        <div class="nav-brand">
            <h1>GeniusTrack</h1>
        </div>
        <div class="nav-links">
            <a href="/adminhome">Admin</a>
            <a href="/Courses">Courses</a>
            <a href="/teacherModal">Teachers</a>
            <a href="/mapcourses">Coursemapping</a>
            <a href="/">Logout</a>
           
        </div>
    </nav>
    </body>
    </html>