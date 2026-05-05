<?php
/*
interface IPricingStrategy {
    public function calculatePrice(float $baseRate, int $duration, float $discount): float;
}
*/
class Rental implements ISubject {
    private string $rentalId;
    private string $rentalStatus;
    private string $rentalPeriod;
    private string $pricingType;
    private float $basePrice;
    private string $duration;/*i will do fn for it , revise Phase2 updates.docx*/
    private array $discounts = [];
    private DateTime $startDate;
    private DateTime $endDate;
    private DateTime $deliveryDate;
    private string $toolCondition;
    private Borrower $borrower;
    private Tool $tool;
    private float $totalAmount;
    private DateTime $actualReturnDate;
    public function __construct(string $rentalId, string $rentalPeriod, Borrower $borrower, Tool $tool, DateTime $startDate, DateTime $endDate) {
        $this->rentalId = $rentalId;
        $this->rentalPeriod = $rentalPeriod;
        $this->borrower = $borrower;
        $this->tool = $tool;
        $this->startDate = $startDate;
        $this->endDate = $endDate;
        $this->rentalStatus = "Pending";
        $this->actualReturnDate = null;
        $this->deliveryDate = null;
        $this->discounts = [];
        $this->toolCondition = "Good";
        $this->totalAmount = 0.0;     
        $this->basePrice = 0.0; 
        $this->pricingType = "";
    }
    

    public function getRentalId(): string {
        return $this->rentalId;
    }
    
    public function setRentalId(string $rentalId): void {
        $this->rentalId = $rentalId;
    }
    
    public function getRentalStatus(): string {
        return $this->rentalStatus;
    }
    
    public function setRentalStatus(string $rentalStatus): void {
        $this->rentalStatus = $rentalStatus;
    }
    
    public function getRentalPeriod(): string {
        return $this->rentalPeriod;
    }
    
    public function setRentalPeriod(string $rentalPeriod): void {
        $this->rentalPeriod = $rentalPeriod;
    }
    
    public function getPricingType(): string {
        return $this->pricingType;
    }
    
    public function setPricingType(string $pricingType): void {
        $this->pricingType = $pricingType;
    }
    
    public function getBasePrice(): float {
        return $this->basePrice;
    }
    
    public function setBasePrice(float $basePrice): void {
        $this->basePrice = $basePrice;
    }
    
    public function getDuration(): string {
        return $this->duration;
    }
    
    public function setDuration(string $duration): void {
        $this->duration = $duration;
    }
    
    public function getDiscounts(): array {
        return $this->discounts;
    }
    
    public function setDiscounts(array $discounts): void {
        $this->discounts = $discounts;
    }
    
    /*public function addDiscount(float $discount): void {
        $this->discounts[] = $discount;
        $this->totalAmount -= $discount;
    }
    */
    public function getStartDate(): DateTime {
        return $this->startDate;
    }
    
    public function setStartDate(DateTime $startDate): void {
        $this->startDate = $startDate;
    }
    
    public function getEndDate(): DateTime {
        return $this->endDate;
    }
    
    public function setEndDate(DateTime $endDate): void {
        $this->endDate = $endDate;
    }
    
    public function getDeliveryDate(): ?DateTime {
        return $this->deliveryDate;
    }
    
    public function setDeliveryDate(?DateTime $deliveryDate): void {
        $this->deliveryDate = $deliveryDate;
    }
    
    public function getToolCondition(): string {
        return $this->toolCondition;
    }
    
    public function setToolCondition(string $toolCondition): void {
        $this->toolCondition = $toolCondition;
    }    

    public function getBorrower(): Borrower {
        return $this->borrower;
    }
    
    public function setBorrower(Borrower $borrower): void {
        $this->borrower = $borrower;
    }
    
    public function getTool(): Tool {
        return $this->tool;
    }
    
    public function setTool(Tool $tool): void {
        $this->tool = $tool;
    }
    
    public function getTotalAmount(): float {
        return $this->totalAmount;
    }
    
    public function setTotalAmount(float $totalAmount): void {
        $this->totalAmount = $totalAmount;
    }
    
    public function getActualReturnDate(): ?DateTime {
        return $this->actualReturnDate;
    }
    
    public function setActualReturnDate(?DateTime $actualReturnDate): void {
        $this->actualReturnDate = $actualReturnDate;
    }


    public function setDefaultPricing(int $default):void{}
    
    public function useDefaultPricing():void{}
    
    public function checkDelay():bool{}
    
    public function closeRental():void{}
    
    public function extend(int $days):void{}
    
    public function calculatePenalty():float{}
    
    public function completeRental():void{}
    public function attach(IObserver $observer):void{}
    public function notifyObservers():void{}

    public function calculateTotalCost(IPricingStrategy $strategy):float{}    
}

?>