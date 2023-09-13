<!DOCTYPE html>
<html>
<head>
    <title>Database Table</title>
</head>
<body>

<?php
$db = pg_connect("host=localhost dbname=webapp user=webuser password=password");
if (!$db) {
    die("Connection failed: " . pg_last_error());
}

$result = pg_query($db, "SELECT id, name FROM users");

if (!$result) {
    echo "Query failed: " . pg_last_error();
} else {
    if (pg_num_rows($result) > 0) {
        echo "<table>";
        echo "<tr><th>ID</th><th>Name</th></tr>";
        while ($row = pg_fetch_assoc($result)) {
            echo "<tr><td>" . $row["id"]. "</td><td>" . $row["name"]. "</td></tr>";
        }
        echo "</table>";
    } else {
        echo "0 results";
    }
}
pg_close($db);
?>

</body>
</html>
