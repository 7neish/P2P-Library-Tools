<?php
require_once __DIR__ . '/../../includes/Database.php';
require_once __DIR__ . '/../../models/user.php';

class AuthController {
    public function login($email, $password) {
        $db = Database::getInstance();
        $email = $db->escape($email);
        $conn = $db->getConnection();
        $res = mysqli_query($conn, "SELECT * FROM Users WHERE email='$email' LIMIT 1");
        if ($res && $row = mysqli_fetch_assoc($res)) {
            $user = new User();
            foreach ($row as $k => $v) $user->$k = $v;
            return $user;
        }
        return null;
    }

    public function register($data) {
        $db = Database::getInstance();
        $conn = $db->getConnection();
        $email    = $db->escape($data['email']);
        $hash     = $db->escape($data['password_hash']);
        $name     = $db->escape($data['full_name']);
        $phone    = $db->escape($data['phone']);
        $address  = $db->escape($data['address'] ?? '');
        $membershipType  = $db->escape($data['membership'] ?? '');
        $role     = $db->escape($data['role'] ?? 'MEMBER');
        $location     = $db->escape($data['location'] ?? '');
        $sql = "INSERT INTO Users (email, password, name, address, role , membershipType , location, phone)
                VALUES ('$email','$hash','$name','$address','$role','$$membershipType','$location' , '$phone')";
        return mysqli_query($conn, $sql);
    }
}