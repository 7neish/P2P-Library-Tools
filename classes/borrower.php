<?php 
require_once 'member.php';
class Borrower extends Member{
    public $zipCode;
    private $trustScore;
    public $activeRentalsCount;
    public $previousRentals = [];
    public $returnDates = [];
    public $status;
    public $onTimeReturn;
    public $distanceLimit;
    public $walletBalance;

    public function __construct($id, $password, $name, $email, $phones, $address, $roleId, $location, $membershipType, $trustScore, $zipCode){
        parent::__construct($id, $password, $name, $email, $phones, $address, $roleId, $location, $membershipType);
        $this->zipCode=$zipCode;
        $this->trustScore=$trustScore;
        $this->activeRentalsCount=0;
        $this->status = "active";
        $this->onTimeReturn = true;
        $this->distanceLimit = 0;
        $this->walletBalance = 0;
    }
    public function getTrustScore(){
        return $this->trustScore;
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