<?php
class MaintenanceTicket {
    private string $ticketId;
    private string $issueDescription;
    private string $status;
    private Tool $tool;
    private DateTime $createdAtDate;
    public function __construct(string $ticketId, Tool $tool, string $issueDescription) {
        $this->ticketId = $ticketId;
        $this->tool = $tool;
        $this->issueDescription = $issueDescription;
        $this->status = "Open";
        $this->createdAtDate = new DateTime();
    }
        public function getTicketId(): string {
        return $this->ticketId;
    }
    
    public function setTicketId(string $ticketId): void {
        $this->ticketId = $ticketId;
    }
    
    public function getIssueDescription(): string {
        return $this->issueDescription;
    }
    
    public function setIssueDescription(string $issueDescription): void {
        $this->issueDescription = $issueDescription;
    }
    
    public function getStatus(): string {
        return $this->status;
    }
    
    public function setStatus(string $status): void {
        $this->status = $status;
    }
    
    public function getTool(): Tool {
        return $this->tool;
    }
    
    public function setTool(Tool $tool): void {
        $this->tool = $tool;
    }
    
    public function getCreatedAtDate(): DateTime {
        return $this->createdAtDate;
    }
    
    public function setCreatedAtDate(DateTime $createdAtDate): void {
        $this->createdAtDate = $createdAtDate;
    }
    
    public function closeTicket(){
        $this->status = "Closed";
    }


?>
