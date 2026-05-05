<?php
class Category {
    private string $categoryId;
    private string $name;
    private array $tools = [];
    private ?Category $parentCategory;
    private array $subCategories = [];
    public function __construct(string $categoryId, string $name,  Category $parentCategory = null) {
        $this->categoryId = $categoryId;
        $this->name = $name;
        $this->parentCategory = $parentCategory;
        $this->subCategories = [];
        $this->tools = [];
    }
    public function getCategoryId(): string {
        return $this->categoryId;
    }
    
    public function setCategoryId(string $categoryId): void {
        $this->categoryId = $categoryId;
    }

    public function getName(): string {
        return $this->name;
    }
    
    public function setName(string $name): void {
        $this->name = $name;
    }

    public function getTools(): array {
        return $this->tools;
    }
    
    public function setTools(array $tools): void {
        $this->tools = $tools;
    }


    public function addTool(Tool $tool){
    // $this->tools[] = $tool;
    }
/*
 public function removeTool(Tool $tool): void {
        $key = array_search($tool, $this->tools, true);
        if ($key !== false) {
            unset($this->tools[$key]);
            $this->tools = array_values($this->tools);
        }
    }
    */

    public function getParentCategory(): ?Category {
        return $this->parentCategory;
    }
    
    public function setParentCategory(?Category $parentCategory): void {
        $this->parentCategory = $parentCategory;
    }
    
    // subCategories
    public function getSubCategories(): array {
        return $this->subCategories;
    }
    
    public function setSubCategories(array $subCategories): void {
        $this->subCategories = $subCategories;
    }
    /*
    public function addSubCategory(Category $subCategory): void {
        $this->subCategories[] = $subCategory;
        // set the parent of the subcategory
        $subCategory->setParentCategory($this);
    }
    
    public function removeSubCategory(Category $subCategory): void {
        $key = array_search($subCategory, $this->subCategories, true);
        if ($key !== false) {
            unset($this->subCategories[$key]);
            $this->subCategories = array_values($this->subCategories);
            $subCategory->setParentCategory(null);
        }
    }*/
}
?>
