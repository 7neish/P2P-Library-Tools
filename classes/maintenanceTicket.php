<?php
class MaintenanceTicket {
    public string $ticketId;
    public string $issueDescription;
    public string $status;
    
    
    public function __construct(string $ticketId, Tool $tool, string $issueDescription) {
        $this->ticketId = $ticketId;
        $this->tool = $tool;
        $this->issueDescription = $issueDescription;
        $this->status = "Open";
        $this->createdAt = new DateTime();
    }
    
    public function closeTicket();
    
  
}