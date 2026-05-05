<?php 
abstract class User{
    protected $id;
    protected $password;
    protected $name;
    protected $email;
    protected $phones=[];
    protected $address;
    protected $roleId;
    protected $location;

    public function __construct($id, $password, $name, $email, $phones, $address, $roleId, $location){
        $this->id=$id;
        $this->password=password_hash($password, PASSWORD_DEFAULT);
        $this->name=$name;
        $this->email=$email;
        $this->phones=$phones;
        $this->address=$address;
        $this->roleId=$roleId;
        $this->location=$location;
    }
    abstract public function verifyIdentity();
}
?>