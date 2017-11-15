<?php
/**
 * @Entity(repositoryClass="MineralRepository") @Table(name="mineral")
 */
class Mineral
{
	/** @Id @Column(type="integer") **/
    private $id;
    /** @Column(type="string") **/
    private $name;
   	/** @Column(type="integer") **/
    private $ref;
    /** @Column(type="integer", options={"default"=1}) **/
    private $type;
    /** @Column(type="float") **/
    private $unitVolume;
    /** @Column(type="float") **/
    private $unitPrice;

    /**
     * One Mineral has Many OreSources.
     * @OneToMany(targetEntity="OreMineral", mappedBy="mineral")
     */
    private $oreSources;


    public function __construct() {
        $this->oreSources = new ArrayCollection();
    }


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
   		return $this->unitPrice;
   	}
    public function getOreSources(){
      return $this->oreSources;
    }

}