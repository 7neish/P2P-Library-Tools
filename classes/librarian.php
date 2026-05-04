<?php 
require_once 'member.php';
class Librarian extends Member{
    public $librarianId;
    public $openTasksCount;

    public function __construct($id, $membershipType, $password, $name, $email, $phones, $address, $tierId, $roleId, $trustScore, $location, $librarianId){
        parent::__construct($membershipType, $password, $name, $email, $phones, $address, $tierId, $roleId, $trustScore, $location);
        $this->librarianId=$librarianId;
        $this->openTasksCount=0;
    }
    public function verifyIdentity()
    public function upgradeMembership()
    public function resolveDispute()
    public function processRefund()
}
?>