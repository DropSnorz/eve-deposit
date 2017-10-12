<?php
/**
 * @Entity(repositoryClass="OreRepository")
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
    /** @Column(type="float") **/
    private $unitVolume;
    /** @Column(type="float") **/
    private $unitPrice;
    /** @Column(type="float") **/
    private $securityLevel;
    /** @Column(type="string", nullable=true) **/
    private $graphicId;
    

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
    public function getSecurityLevel(){
      return $this->securityLevel;
    }
    public function getGraphicId(){
      return $this->graphicId;
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