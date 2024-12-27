require 'sqlite3'

DB = SQLite3::Database.new("crud_app.db")
DB.results_as_hash = true

# Create a table if it doesn't exist
DB.execute <<-SQL
    CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT
    );
SQL