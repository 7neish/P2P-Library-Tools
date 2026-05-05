<?php
interface IPricingStrategy {
    public function calculatePrice(float $baseRate, int $duration, float $discount): float;
}

class Rental implements ISubject {
    private string $rentalId;
    private string $rentalStatus;
    private string $rentalPeriod;
    private string $pricingType;
    private float $basePrice;
    private string $duration;
    private array $discounts = [];
    private DateTime $startDate;
    private DateTime $endDate;
    private DateTime $deliveryDate;
    private string $toolCondition;

    
    
    public function __construct(string $rentalId, Borrower $borrower, Tool $tool, DateTime $startDate, DateTime $endDate) {
        $this->rentalId = $rentalId;
        $this->borrower = $borrower;
        $this->tool = $tool;
        $this->startDate = $startDate;
        $this->endDate = $endDate;
        $this->rentalStatus = "Pending";
    }
    
    public function setDefaultPricing(int $default);
    
    public function useDefaultPricing();
    
    public function checkDelay();
    
    public function closeRental();
    
    public function extend(int $days);
    
    public function calculatePenalty();
    
    public function completeRental();
    public function attach(IObserver $observer);
     public function notifyObservers();
    


    
    public function calculateTotalCost(IPricingStrategy $strategy);

    
    
 
    
   
    
}