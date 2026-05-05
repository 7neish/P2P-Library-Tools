<?php
class Repair {
    private int $repairId;
    private DateTime $startDate;
    private DateTime $startTime;
    private float $repairTime;
    private DateTime $endTime;
    private array $repairQueue = [];
    private array $completionDates = [];
    private array $recurringfaults = [];
    private string $monthlyReportForComparingTechnicianPerformance;
    private string $repairStatus;
    private int $noOfDaysAfterArrivingTheMalfunctionalTool;
    private Technician $technician;
    private Tool $tool;
    
    public function __construct(int $repairId,Technician $technician,  Tool $tool) {
        $this->repairId=$repairId;
        $this->technician = $technician;
        $this->tool = $tool;
        $this->startTime = new DateTime();
        $this->repairStatus = "In Progress";
        $this->startDate = new DateTime();
        $this->endTime = null;
        $this->noOfDaysAfterArrivingTheMalfunctionalTool = 0;
        $this->monthlyReportForComparingTechnicianPerformance = "";
    }
     public function getRepairId(): int {
        return $this->repairId;
    }
    
    public function setRepairId(int $repairId): void {
        $this->repairId = $repairId;
    }
    
    public function getStartDate(): DateTime {
        return $this->startDate;
    }
    
    public function setStartDate(DateTime $startDate): void {
        $this->startDate = $startDate;
    }
    
    public function getStartTime(): DateTime {
        return $this->startTime;
    }
    
    public function setStartTime(DateTime $startTime): void {
        $this->startTime = $startTime;
    }
    
    public function getRepairTime(): float {
        return $this->repairTime;
    }
    
    public function setRepairTime(float $repairTime): void {
        $this->repairTime = $repairTime;
    }
    
    public function getEndTime(): ?DateTime {
        return $this->endTime;
    }
    
    public function setEndTime(?DateTime $endTime): void {
        $this->endTime = $endTime;
    }
    
    public function getRepairQueue(): array {
        return $this->repairQueue;
    }
    
    public function setRepairQueue(array $repairQueue): void {
        $this->repairQueue = $repairQueue;
    }
    /*
    public function addToRepairQueue($item): void {
        $this->repairQueue[] = $item;
    }
    */
    public function getCompletionDates(): array {
        return $this->completionDates;
    }
    
    public function setCompletionDates(array $completionDates): void {
        $this->completionDates = $completionDates;
    }
    /*
    public function addCompletionDate(DateTime $date): void {
        $this->completionDates[] = $date;
    }
    */
    public function getRecurringFaults(): array {
        return $this->recurringfaults;
    }
    
    public function setRecurringFaults(array $recurringfaults): void {
        $this->recurringfaults = $recurringfaults;
    }
    /*
    public function addRecurringFault($fault): void {
        $this->recurringfaults[] = $fault;
    }
    */
    
    public function getMonthlyReport(): string {
        return $this->monthlyReportForComparingTechnicianPerformance;
    }
    
    public function setMonthlyReport(string $report): void {
        $this->monthlyReportForComparingTechnicianPerformance = $report;
    }
    
    public function getRepairStatus(): string {
        return $this->repairStatus;
    }
    
    public function setRepairStatus(string $repairStatus): void {
        $this->repairStatus = $repairStatus;
    }
    
    public function getNoOfDaysAfterArriving(): int {
        return $this->noOfDaysAfterArrivingTheMalfunctionalTool;
    }
    
    public function setNoOfDaysAfterArriving(int $days): void {
        $this->noOfDaysAfterArrivingTheMalfunctionalTool = $days;
    }
    
    public function getTechnician(): Technician {
        return $this->technician;
    }
    
    public function setTechnician(Technician $technician): void {
        $this->technician = $technician;
    }
    
    public function getTool(): Tool {
        return $this->tool;
    }
    
    public function setTool(Tool $tool): void {
        $this->tool = $tool;
    }
    

    public function isRecurringFaultDueToToolDesignIssueOrTechnicianError(array $recurringFault);
    
    public function applyDifficultyWeightingFactor(int $technicianId, string $fault);
    

    
  
}
?>
