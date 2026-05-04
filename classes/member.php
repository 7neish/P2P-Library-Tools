<?php 
abstract class Member{
    protected $id;
    protected $membershipType;
    protected $password;
    protected $name;
    protected $email;
    protected $phones;
    protected $address;
    protected $tierId;
    protected $roleId;
    protected $trustScore;
    protected $location;

    public function __construct($id, $membershipType, $password, $name, $email, $phones, $address, $tierId, $roleId, $trustScore, $location){
        $this->id=$id;
        $this->membershipType=$membershipType;
        $this->password=$password;
        $this->name=$name;
        $this->email=$email;
        $this->phones=$phones;
        $this->address=$address;
        $this->tierId=$tierId;
        $this->roleId=$roleId;
        $this->trustScore=$trustScore;
        $this->location=$location;
    }
    abstract public function verifyIdentity();
    abstract public function upgradeMembership();
}
?>