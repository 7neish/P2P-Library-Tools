<?php
class Tool {
    public float $toolPrice;
      public string $name;
            public float $longitude;
            public float $latitude;
                private Lender $lender;
    public string $toolStatus;




    public DateTime $bufferStartTime;
    public DateTime $bufferEndTime;
    public int $requestId;
    public array $confirmedReservation = [];
    private bool $available;
 
      public function __construct(float $toolPrice, string $name, float $longitude,float $latitude, Lender $lender) {
        $this->toolPrice = $toolPrice;
        $this->name = $name;
        $this->longitude = $longitude;
        $this->latitude = $latitude;        
        $this->lender = $lender;
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

    public function getLender(): Lender { return $this->lender; }
   
    public function setLender(Lender $lender): void {
        $this->Lender = $lender;
    }


}
?>
