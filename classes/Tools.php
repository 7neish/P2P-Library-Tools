<?php
class Tool {
    private float $toolPrice;
    private string $name;
    private float $longitude;
    private float $latitude;
    private Lender $lender;
    private string $toolStatus;
    private DateTime $bufferStartTime;
    private DateTime $bufferEndTime;
    private int $requestId;
    private array $confirmedReservation = [];
    private bool $available;
     private string $toolStatus;  

 
      public function __construct(float $toolPrice, string $name, float $longitude,float $latitude, Lender $lender) {
        $this->toolPrice = $toolPrice;
        $this->name = $name;
        $this->longitude = $longitude;
        $this->latitude = $latitude;        
        $this->lender = $lender;
        $this->available = true;
        $this->toolStatus = "Available";
    }
    

}
//===============Setter
    
    public function setToolStatus($status) {
        $validStatuses = ['available', 'rented', 'maintenance', 'retired'];
        if (in_array($status, $validStatuses)) {
            $this->toolStatus = $status;
        }
    }
   




 public function setToolPrice(float $price): void {
        if ($price > 0) {
            $this->toolPrice = $price;
        }
    }
    
    public function setName(string $name): void {
        $this->name = $name;
    }
    
    public function setLongitude(float $longitude): void {
        $this->longitude = $longitude;
    }
    
    public function setLatitude(float $latitude): void {
        $this->latitude = $latitude;
    }
    
    public function setBufferStartTime(?DateTime $time): void {
        $this->bufferStartTime = $time;
    }
    
    public function setBufferEndTime(?DateTime $time): void {
        $this->bufferEndTime = $time;
    }
    
    public function setAvailable(bool $available): void {
        $this->available = $available;
        $this->toolStatus = $available ? "Available" : "Rented";
    }
    //==============================

  
    // ========== GETTERS ==========
    
    public function getToolPrice(): float {
        return $this->toolPrice;
    }
    
    public function getName(): string {
        return $this->name;
    }
    
    public function getLongitude(): float {
        return $this->longitude;
    }
    
    public function getLatitude(): float {
        return $this->latitude;
    }
    
    public function getLender(): Lender {
        return $this->lender;
    }
    
    public function getToolStatus(): string {
        return $this->toolStatus;
    }
    
    public function getBufferStartTime(): ?DateTime {
        return $this->bufferStartTime;
    }
    
    public function getBufferEndTime(): ?DateTime {
        return $this->bufferEndTime;
    }
    
    public function isAvailable(): bool {
        return $this->available;
    }



/*
    public function markAvailable();
    
    public function markUnavailable();
    
    public function checkMaintenanceThreshold();
    
    public function setBufferPeriod(int $toolId, DateTime $bufferStartTime, DateTime $bufferEndTime);
    
    public function attach(IObserver $observer);
    public function notifyObservers();
  public function setState(IToolState $state);
       public function performStateAction();


    
    
  
    
    
    // Getters and Setters
    // like get avaialble
    public function isAvailable(){
              return $this->available;

    }

    public function getLender(): Lender { return $this->lender; }
   
    public function setLender(Lender $lender): void {
        $this->Lender = $lender;
    }
*/