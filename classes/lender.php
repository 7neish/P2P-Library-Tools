<?php 
require_once 'member.php';
class Lender extends Member{
    private $tools=[];
    public $listedToolsCount;
    public $totalEarnings;
    public $feedback;

    public function __construct($id, $membershipType, $password, $name, $email, $phones, $address, $tierId, $roleId, $trustScore, $location){
        parent::__construct($membershipType, $password, $name, $email, $phones, $address, $tierId, $roleId, $trustScore, $location);
        $this->listedToolsCount=0;
        $this->totalEarnings=0;
        $this->feedback=[];
    }
    public function verifyIdentity()
    public function upgradeMembership()
    public function gettools(){
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