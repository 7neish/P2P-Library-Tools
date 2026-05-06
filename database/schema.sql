DROP DATABASE IF EXISTS p2p_tool_library;
CREATE DATABASE p2p_tool_library CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE p2p_tool_library;


CREATE TABLE membership_tiers (
    tier_id INT AUTO_INCREMENT PRIMARY KEY,
    tier_name VARCHAR(50) NOT NULL,
    discount_rate DECIMAL(5,2) DEFAULT 0,
    min_rentals_required INT DEFAULT 0,
    min_trust_score DECIMAL(5,2) DEFAULT 0
);


CREATE TABLE Users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    address TEXT,
    location VARCHAR(255),
    role VARCHAR(10),
    membershipType VARCHAR(50),
    phone VARCHAR(20) NOT NULL,
    is_blacklisted TINYINT(1) DEFAULT 0,
);


CREATE TABLE MaintenanceTechnicians (
    user_id INT PRIMARY KEY,
    techId VARCHAR(50) UNIQUE,
    specialty VARCHAR(100),
    technicianRole VARCHAR(100),
    sumOfRepairTimes INT DEFAULT 0,
    noOfSuccessfulRepairs INT DEFAULT 0,
    noOfTotalRepairs INT DEFAULT 0,
    averageRepairTime FLOAT DEFAULT 0,
    FirstTimeSuccessRate FLOAT DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
);


CREATE TABLE Librarians (
    user_id INT PRIMARY KEY,
    librarianId VARCHAR(50) UNIQUE,
    openTasksCount INT DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
);


CREATE TABLE Lenders (
    user_id INT PRIMARY KEY,
    listedToolsCount INT DEFAULT 0,
    totalEarnings DECIMAL(10, 2) DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
);


CREATE TABLE Borrowers (
    user_id INT PRIMARY KEY,
    zipCode VARCHAR(20),
    trustScore FLOAT DEFAULT 0,
    activeRentalsCount INT DEFAULT 0,
    status VARCHAR(50),
    onTimeReturn BOOLEAN DEFAULT TRUE,
    distanceLimit INT,
    walletBalance DECIMAL(10, 2) DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES Users(id) ON DELETE CASCADE
);

CREATE TABLE zones (
    zone_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    librarian_id INT,
    center_latitude DECIMAL(10,7),
    center_longitude DECIMAL(10,7),
    radius_km DECIMAL(6,2) DEFAULT 5,
    FOREIGN KEY (librarian_id) REFERENCES Librarians(user_id)
);

CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    parent_id INT DEFAULT NULL,
    name VARCHAR(100) NOT NULL,
    level INT DEFAULT 1,
    description VARCHAR(255),
    FOREIGN KEY (parent_id) REFERENCES categories(category_id)
);

CREATE TABLE tools (
    tool_id INT AUTO_INCREMENT PRIMARY KEY,
    owner_id INT NOT NULL,
    category_id INT NOT NULL,
    zone_id INT,
    tool_name VARCHAR(255) NOT NULL,
    description TEXT,
    serial_number VARCHAR(100),
    hourly_rate DECIMAL(10,2) DEFAULT 0,
    daily_rate DECIMAL(10,2) DEFAULT 0,
    weekly_rate DECIMAL(10,2) DEFAULT 0,
    deposit_amount DECIMAL(10,2) DEFAULT 0,
    buffer_hours INT DEFAULT 10, 
    status VARCHAR(20) DEFAULT 'AVAILABLE', 
    latitude DECIMAL(10,7),
    longitude DECIMAL(10,7),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (owner_id) REFERENCES Lenders(user_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (zone_id) REFERENCES zones(zone_id)
);

CREATE TABLE tool_documents (
    document_id INT AUTO_INCREMENT PRIMARY KEY,
    tool_id INT NOT NULL,
    doc_type VARCHAR(50), 
    file_url VARCHAR(500),
    upload_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expiry_date DATE,
    FOREIGN KEY (tool_id) REFERENCES tools(tool_id) ON DELETE CASCADE
);


CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    tool_id INT NOT NULL,
    borrower_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    actual_return_time DATETIME DEFAULT NULL,
    rental_cost DECIMAL(10,2) DEFAULT 0,
    deposit_amount DECIMAL(10,2) DEFAULT 0,
    total_price DECIMAL(15,2) DEFAULT 0,
    status VARCHAR(20) DEFAULT 'PENDING', 
    qr_handover_code VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tool_id) REFERENCES tools(tool_id),
    FOREIGN KEY (borrower_id) REFERENCES Borrowers(user_id)
);

CREATE TABLE escrow_transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'HELD', 
    transaction_type VARCHAR(20) DEFAULT 'DEPOSIT', 
    notes VARCHAR(500),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON DELETE CASCADE
);


CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    reviewer_id INT NOT NULL, 
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment VARCHAR(500),
    tool_condition_rating INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    FOREIGN KEY (reviewer_id) REFERENCES Users(id)
);

CREATE TABLE messages (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_id INT NOT NULL,
    receiver_id INT NOT NULL,
    booking_id INT,
    encrypted_content TEXT,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES Users(id),
    FOREIGN KEY (receiver_id) REFERENCES Users(id),
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id)
);


CREATE TABLE damage_reports (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    description TEXT,
    photo_evidence_url VARCHAR(500),
    estimated_repair_cost DECIMAL(10,2),
    status VARCHAR(20) DEFAULT 'PENDING', 
    technician_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id),
    FOREIGN KEY (technician_id) REFERENCES MaintenanceTechnicians(user_id)
);

CREATE TABLE maintenance_logs (
    maintenance_id INT AUTO_INCREMENT PRIMARY KEY,
    tool_id INT NOT NULL,
    technician_id INT,
    task_description TEXT,
    cost DECIMAL(10,2),
    usage_hours_at_service INT,
    service_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    next_service_due TIMESTAMP NULL,
    FOREIGN KEY (tool_id) REFERENCES tools(tool_id) ON DELETE CASCADE,
    FOREIGN KEY (technician_id) REFERENCES MaintenanceTechnicians(user_id)
);


CREATE TABLE promotions (
    promotion_id INT AUTO_INCREMENT PRIMARY KEY,
    promo_code VARCHAR(50) UNIQUE,
    discount_percent DECIMAL(5,2),
    category_id INT NULL,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);