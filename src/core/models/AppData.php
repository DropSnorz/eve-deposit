<?php

/**
* @Entity @Table(name="app_data")
*/
Class AppData{
    
    /**
    * @Id @Column(type="string")
    */
    protected $id;
    
    /**
    * @Column(type="string")
    */
    protected $value;


    public function setId($id){
        $this->id = $id;
    }
    public function setValue($value){
        $this->value = $value;
    }
    public function getValue(){
        return $this->value;
    }
    
        
}