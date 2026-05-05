<?php
class Tool {
    public float $toolPrice;
      public string $name;
            public float $longitude;
                private Lender $lender;
    public string $toolStatus;




    public DateTime $bufferStartTime;
    public DateTime $bufferEndTime;
    public int $requestId;
    public array $confirmedReservation = [];
    private bool $available;
 
      public function __construct(float $toolPrice, string $name, float $longitude, Owner $owner) {
        $this->toolPrice = $toolPrice;
        $this->name = $name;
        $this->longitude = $longitude;
        $this->owner = $owner;
        $this->available = true;
        $this->toolStatus = "Available";
    }



    
    
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

    public function getOwner(): Owner { return $this->owner; }
   
    public function setOwner(Owner $owner): void {
        $this->owner = $owner;
    }


}
?>