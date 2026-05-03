# P2P Library Tools

A peer-to-peer web application for lending and borrowing high-value specialized tools.
Built with **PHP (OOP/PDO)**, **MySQL**, **Bootstrap 5**, and **Vanilla JavaScript (ES6+)**.

## Requirements
- PHP 8.0+ with PDO MySQL extension
- MySQL 8.0+
- Apache with mod_rewrite (or equivalent)

## Installation

1. **Database Setup:**
   ```bash
   mysql -u root -p < database/schema.sql
   ```

2. **Configure Database:**
   Edit `config/database.php` and set your MySQL credentials, or set environment variables:
   - `DB_HOST` (default: localhost)
   - `DB_NAME` (default: p2p_tool_library)
   - `DB_USER` (default: )
   - `DB_PASS` (default: )

3. **Uploads Directory:**
   ```bash
   mkdir -p uploads/{tools,docs,videos,kyc,damage,certs}
   chmod -R 755 uploads/
   ```

4. **Start Server:**
   - With XAMPP/WAMP: Place project in `htdocs/`
   - With PHP built-in server: `php -S localhost:8000`

5. **Default Admin Login:**
   - Email: `admin@p2ptool.com`
   - Password: `admin123`

## Project Structure
```
├── api/            # Backend API endpoints
├── classes/        # OOP PHP model classes
├── config/         # Database, session, helpers
├── database/       # MySQL schema
├── assets/         # CSS and JavaScript
├── includes/       # Header/footer templates
├── pages/          # Frontend pages
│   ├── tools/
│   ├── reservations/
│   ├── messages/
│   ├── librarian/
│   └── maintenance/
└── uploads/        # User uploads (created at runtime)
```

## 42 Use Cases Implemented
Covers all 42 use cases across 3 modules:
- **Member Module**
- **Librarian Module**
- **Maintenance Module**
## Tech Stack
- **Frontend:** Bootstrap 5.3.3, Vanilla JavaScript (ES6+)
- **Backend:** PHP 8.0+ (OOP, PDO)
- **Database:** MySQL 8.0+ with prepared statements
- **Security:** Input validation (client+server), XSS protection, SQL injection prevention via PDO
