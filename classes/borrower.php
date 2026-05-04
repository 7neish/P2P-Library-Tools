<?php 
require_once 'member.php';
class Borrower extends Member{
    public $zipCode;
    public $activeRentalsCount;
    public $previousRentals;
    public $returnDates;
    public $status;
    public $onTimeReturn;
    public $distanceLimit;
    public $walletBalance;

    public function __construct($id, $membershipType, $password, $name, $email, $phones, $address, $tierId, $roleId, $trustScore, $location, $zipCode){
        parent::__construct($membershipType, $password, $name, $email, $phones, $address, $tierId, $roleId, $trustScore, $location);
        $this->zipCode=$zipCode;
        $this->activeRentalsCount=0;
        $this->previousRentals=[];
        $this->returnDates=[];
        $this->status="active";
        $this->onTimeReturn=true;
        $this->distanceLimit=0;
        $this->walletBalance=0;
    }
    public function verifyIdentity()
    public function upgradeMembership()
    public function selectItemToRent()
    public function specifyRentalPeriod()
    public function viewFinalPrice()
    public function rentItem()
    public function increaseTrust()
    public function decreaseTrust()
    public function requestReservation()
    public function reportDamage()
    public function searchSpecificTool()
    public function submitReservationRequest()
}
?>