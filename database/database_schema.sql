-- Items table to store all inventory items
CREATE TABLE items(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    category TEXT,
    location TEXT,
    quantity INTEGER DEFAULT 0,
    unit TEXT,
    min_quantity INTEGER DEFAULT 0,
    purchase_link TEXT,
    notes TEXT,
    added_by TEXT,
    date_added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Transactions table to log all inventory changes
CREATE TABLE transactions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    item_id INTEGER NOT NULL,
    quantity_change INTEGER NOT NULL,
    transaction_type TEXT NOT NULL, -- "add", "remove", "adjust"
    user_id TEXT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    notes TEXT,
    FOREIGN KEY (item_id) REFERENCES items(id)
);

-- Users table for basic authentication
CREATE TABLE users(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE NOT NULL,
    email TEXT UNIQUE NOT NULL,
    access_token TEXT UNIQUE,
    is_admin BOOLEAN DEFAULT 0,
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes for faster queries
CREATE INDEX idx_items_name ON items(name);
CREATE INDEX idx_items_category ON items(category);
CREATE INDEX idx_transaction_item_id ON transactions(item_id);
CREATE INDEX idx_users_access_token ON users(access_token);
