<?php
/**
 * @Entity(repositoryClass="MineralRepository")
 */
class OreMineral
{
	/** @Id @Column(type="integer") **/
    private $id;
    /**
     * Many OreMineral have One Ore.
     * @ManyToOne(targetEntity="Ore", inversedBy="reprocessedMinerals")
     * @JoinColumn(name="ore_id", referencedColumnName="id")
     */
    private $ore;
   	/**
     * Many OreMineral have One Mineral.
     * @ManyToOne(targetEntity="Mineral", inversedBy="sourceOres")
     * @JoinColumn(name="mineral_id", referencedColumnName="id")
     */
    private $mineral;
    /** @Column(type="float") **/
    private $reprocessingEfficiency;

   	public function getId(){
   		return $this->id;
   	}
   	public function getOre(){
   		return $this->ore;
   	}
   	public function getMineral(){
   		return $this->mineral;
   	}
   	public function getReprocessingEfficiency(){
   		return $this->reprocessingEfficiency;
   	}
}