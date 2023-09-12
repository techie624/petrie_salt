CREATE DATABASE IF NOT EXISTS webapp;
USE webapp;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Insert some sample data
INSERT INTO users (name) VALUES ('Reading'), ('Database'), ('Data');
