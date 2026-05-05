<?php 
require_once 'user.php';
class Librarian extends User{
    public $librarianId;
    public $openTasksCount;

    public function __construct($id, $password, $name, $email, $phones, $address, $roleId, $location, $librarianId){
        parent::__construct($id, $password, $name, $email, $phones, $address, $roleId, $location);
        $this->librarianId=$librarianId;
        $this->openTasksCount=0;
    }
    public function verifyIdentity()
    public function resolveDispute()
    public function processRefund()
}
?>