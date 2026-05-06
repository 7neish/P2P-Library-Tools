<?php


class Database {
    private static $conn = null;

    
    public static function getConnection() {
        if (self::$conn === null) {
            
            $host     = 'localhost';
            $user     = 'root';
            $password = '';
            $database = 'p2p_tool_library';

            self::$conn = mysqli_connect($host, $user, $password, $database);

            if (!self::$conn) {
                die('Database connection failed: ' . mysqli_connect_error());
            }
            
            mysqli_set_charset(self::$conn, 'utf8mb4');
        }
        return self::$conn;
    }

    
    public static function escape($value) {
        return mysqli_real_escape_string(self::getConnection(), $value);
    }
}
