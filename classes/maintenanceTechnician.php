<?php
require_once 'member.php';
class MaintenanceTechnician extends Member{
    public $techId;
    public $name;
    public $specialty;
    public $technicianRole;
    public $sumOfRepairTimes;
    public $noOfSuccessfulRepairs;
    public $noOfTotalRepairs;
    public $noOfRepairs;
    public $averageRepairTime;
    public $FirstTimeSuccessRate;

    public function __construct($id, $membershipType, $password, $name, $email, $phones, $address, $tierId, $roleId, 
    $trustScore, $location, $techId, $specialty, $technicianRole){
        parent::__construct($membershipType, $password, $name, $email, $phones, $address, $tierId, $roleId, $trustScore, $location);
        $this->techId=$techId;
        $this->specialty=$specialty;
        $this->technicianRole=$technicianRole;
        $this->sumOfRepairTimes=0;
        $this->noOfSuccessfulRepairs=0;
        $this->noOfTotalRepairs=0;
        $this->noOfRepairs=0;
        $this->averageRepairTime=0;
        $this->FirstTimeSuccessRate=0;
    }
    public function verifyIdentity()
    public function upgradeMembership()
    public function completeToolRepair()
    public function closeRepairOrder()
    public function updateDashboard()
} 
?>