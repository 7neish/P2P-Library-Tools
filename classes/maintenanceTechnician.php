<?php
require_once 'user.php';
class MaintenanceTechnician extends User{
    public $techId;
    public $specialty;
    public $technicianRole;
    public $sumOfRepairTimes = 0;
    public $noOfSuccessfulRepairs = 0;
    public $noOfTotalRepairs = 0;
    public $noOfRepairs = 0;
    public $averageRepairTime = 0;
    public $FirstTimeSuccessRate = 0;

    public function __construct($id, $password, $name, $email, $phones, $address, $roleId, $location, $techId, $specialty, $technicianRole){
        parent::__construct($id, $password, $name, $email, $phones, $address, $roleId, $location);
        $this->techId=$techId;
        $this->specialty=$specialty;
        $this->technicianRole=$technicianRole;
    }
    public function verifyIdentity()
    public function completeToolRepair()
    public function closeRepairOrder()
    public function updateDashboard()
} 
?>