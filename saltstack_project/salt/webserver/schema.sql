-- Database creation is handled in the init_pg.sh script

CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Insert some sample data
INSERT INTO users (name) VALUES ('Reading'), ('Database'), ('Data');
