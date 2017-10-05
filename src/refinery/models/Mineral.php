<?php
/**
 * @Entity(repositoryClass="MineralRepository")
 */
class Mineral
{
	/** @Id @Column(type="integer") **/
    private $id;
    /** @Column(type="string") **/
    private $name;
   	/** @Column(type="integer") **/
    private $ref;
    /** @Column(type="float") **/
    private $unitVolume;
    /** @Column(type="float") **/
    private $unitPrice;

   	public function getId(){
   		return $this->id;
   	}
   	public function getName(){
   		return $this->name;
   	}
   	public function getRef(){
   		return $this->ref;
   	}
   	public function getUnitVolume(){
   		return $this->unitVolumne;
   	}
   	public function getUnitPrice(){
   		return $this->unitPrice();
   	}

}