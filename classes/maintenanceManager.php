<?php 
require_once 'member.php';
class MaintenanceManager extends Member{
    public function __construct($id, $membershipType, $password, $name, $email, $phones, $address, $tierId, $roleId, $trustScore, $location){
      parent::__construct($membershipType, $password, $name, $email, $phones, $address, $tierId, $roleId, $trustScore, $location);  
    }
    public function verifyIdentity()
    public function upgradeMembership()
    public function openPerformanceReport()
    public function useReportToIdentifyTechniciansWhoNeedAdditionalTraining()
    public function update()
}
?>