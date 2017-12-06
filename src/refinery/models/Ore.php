<?php
/**
 * @Entity(repositoryClass="OreRepository") @Table(name="ore")
 * @InheritanceType("SINGLE_TABLE")
 * @DiscriminatorColumn(name="discr", type="string")
 * @DiscriminatorMap({"primary" = "PrimaryOre", "secondary" = "SecondaryOre"})
 */
class Ore
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
    /** @Column(type="float", nullable = true) **/
    private $normalizedPrice;
    /** @Column(type="float") **/
    private $securityLevel;
    /** @Column(type="string", nullable=true) **/
    private $graphicId;
    /** @Column(type="boolean", options={"default"=false}) **/
    private $special;

    /**
     * One Ore has Many Minerals.
     * @OneToMany(targetEntity="OreMineral", mappedBy="ore")
     */
    private $reprocessedMinerals;
    

    public function __construct() {
        $this->reprocessedMinerals = new ArrayCollection();
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
   		return $this->unitVolume;
   	}
   	public function getUnitPrice(){
   		return $this->unitPrice;
   	}
    public function setUnitPrice($unitPrice){
      $this->unitPrice = $unitPrice;
    }
    public function getSecurityLevel(){
      return $this->securityLevel;
    }
    public function getGraphicId(){
      return $this->graphicId;
    }
    public function getReprocessedMinerals(){
      return $this->reprocessedMinerals;
    }
    public function getNormalizedPrice(){
      return $this->normalizedPrice;
    }
    public function setNormalizedPrice($np){
      $this->normalizedPrice = $np;
    }


}

/**
 * @Entity
 */
class PrimaryOre extends Ore
{
    // ...

    /**
     * One Primary as Many Secondary Ores
     * @OneToMany(targetEntity="SecondaryOre", mappedBy="primaryOre")
     */
    private $secondaryOres;

    public function __construct() {
		
		$this->secondaryOres = new ArrayCollection();

	}


    public function getSecondaryOres(){
    	return $this->secondaryOres;
    }
}


/**
 * @Entity
 */
class SecondaryOre extends Ore
{
	/**
    * Many Secondary have One Primary Ore.
    * @ManyToOne(targetEntity="PrimaryOre", inversedBy="secondaryOres")
    * @JoinColumn(name="id_primaryOre", referencedColumnName="id")
    */
	private $primaryOre;

	public function getPrimaryOre(){
		return $this->primaryOre;
	}

}