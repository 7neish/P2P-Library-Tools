<?php 
require_once 'user.php';
class MaintenanceManager extends User{
    public function __construct($id, $password, $name, $email, $phones, $address, $roleId, $location){
      parent::__construct($id, $password, $name, $email, $phones, $address, $roleId, $location);  
    }
    public function verifyIdentity()
    public function openPerformanceReport()
    public function useReportToIdentifyTechniciansWhoNeedAdditionalTraining()
    public function update()
}
?>