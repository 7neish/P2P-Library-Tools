<?php 
require_once 'member.php';
class Lender extends Member{
    private $tools=[];
    public $listedToolsCount;
    public $totalEarnings;
    public $feedback=[];

    public function __construct($id, $password, $name, $email, $phones, $address, $roleId, $location, $membershipType){
        parent::__construct($id, $password, $name, $email, $phones, $address, $roleId, $location, $membershipType);
        $this->listedToolsCount=0;
        $this->totalEarnings=0;
    }
    public function verifyIdentity()
    public function upgradeMembership()
    public function getTools(){
        return $this->tools;
    }
    public function setTools($tool){
        $this->tools[]=$tool;
        $this->listedToolsCount++;
    }
    public function approveRental()
    public function rejectRental()
    public function viewFinalPrice()
    public function listNewTool()
    public function promoteListing()
}
?>