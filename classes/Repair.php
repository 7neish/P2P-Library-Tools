<?php
class Repair {
    public int $repairId;
    public DateTime $startDate;
    public float $startTime;
    public float $repairTime;
    public float $endTime;
    public array $repairQueue = [];
    public array $completionDates = [];
    public array $recurringfaults = [];
    public string $monthlyReportForComparingTechnicianPerformance;
    public string $repairStatus;
    public int $noOfDaysAfterArrivingTheMalfunctionalTool;

    
    public function __construct() {
    }
    
    public function isRecurringFaultDueToToolDesignIssueOrTechnicianError(array $recurringFault);
    
    public function applyDifficultyWeightingFactor(int $technicianId, string $fault);
    

    
  
}