<?php
require_once 'user.php'; 
abstract class Member extends User{
    protected $membershipType;

    public function __construct($id, $password, $name, $email, $phones, $address, $roleId, $location, $membershipType){
        parent::__construct($id, $password, $name, $email, $phones, $address, $roleId, $location);
        $this->membershipType=$membershipType;
    }
    abstract public function verifyIdentity();
    abstract public function upgradeMembership();
}
?>