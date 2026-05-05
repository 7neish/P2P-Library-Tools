<?php
class Category {
    public string $categoryId;
    public string $name;
    
    public function __construct(string $categoryId, string $name) {
        $this->categoryId = $categoryId;
        $this->name = $name;
    }
    
    public function addTool(Tool $tool);
      
    
}