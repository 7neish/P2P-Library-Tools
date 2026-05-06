<?php
class DBController {
    private $conn = null;

    public function getConnection() {
        if ($this->conn === null) {
            $host = 'localhost';
            $user = 'root';
            $password = '';
            $database = 'os_project';
            $this->conn = mysqli_connect($host, $user, $password, $database);
            if (!$this->conn) {
                die('Database connection failed: ' . mysqli_connect_error());
            }
            mysqli_set_charset($this->conn, 'utf8mb4');
        }
        return $this->conn;
    }

    public function escape($value) {
        return mysqli_real_escape_string($this->getConnection(), $value);
    }
}