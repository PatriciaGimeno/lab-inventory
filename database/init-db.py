import sqlite3

# Create and connect to the database
conn = sqlite3.connect('inventory.db')

# Read the schema file
with open('database_schema.sql', 'r') as schema_file:
    schema = schema_file.read()

# Execute the schema commands
conn.executescript(schema)

# Close connection
conn.close()

print("Database initialized successfully!")
