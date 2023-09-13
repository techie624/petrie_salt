<!DOCTYPE html>
<html>
<head>
    <title>DevOps Space</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Philosopher:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
    
    <link rel="icon" href="images/devops.png" type="image/x-icon">
</head>
<body>
    <header>
        <div class="banner">
            <h1>Devops Salt Testing Platform</h1>
        </div>
    </header>
    <nav id="sidebar">
        <ul>
            
            <li><a href="./index.html">Roy Petrie</a></li>
            <li><a href="https://www.linkedin.com/in/rpetrie/">Linkedin</a></li>
            <li><a href="https://github.com/techie624">Github</a></li>
        </ul>
    </nav>
    <main>
        echo "Before Table";
        <?php
        $servername = "localhost";
        $username = "webuser";
        $password = "password";
        $dbname = "webapp";
        
        // Create connection
        $conn = new mysqli($servername, $username, $password, $dbname);
        
        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }
        
        $sql = "SELECT id, name FROM users";
        $result = $conn->query($sql);
        
        if ($result->num_rows > 0) {
            // Output data of each row
            echo "<table>";
            echo "<tr><th>ID</th><th>Name</th></tr>";
            while($row = $result->fetch_assoc()) {
                echo "<tr><td>" . $row["id"]. "</td><td>" . $row["name"]. "</td></tr>";
            }
            echo "</table>";
        } else {
            echo "0 results";
        }
        
        $conn->close();
        ?>
        echo "After Table";
        <div class="description">
            <h2 class="centered-heading">Hello Engineers!</h2>
            <div class="character-grid">

                <div class="character-item">
                    <a href="https://www.linkedin.com/in/rpetrie/"><img src="./images/profile_linkedin.png" alt="Linkedin"></a>
                    <h3>Linkedin</h3>
                </div>

                <div class="character-item">
                    <a href="https://github.com/techie624"><img src="./images/profile_github.png" alt="Github"></a>
                    <h3>Github</h3>
                </div>
            </div>
        </div>
    </main>
    <footer>
        <p><i>Welcome!</i></p>
    </footer>
</body>
</html>
