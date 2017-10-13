<?php

use Doctrine\ORM\EntityRepository;

class OreRepository extends EntityRepository{

	public function findAllPrimaryOreSecondaryRelated()
	{
	   $dql = "SELECT p, s, pom, m FROM PrimaryOre p JOIN p.secondaryOres s LEFT JOIN p.reprocessedMinerals pom LEFT JOIN pom.mineral m";
       $query = $this->getEntityManager()->createQuery($dql);

       return $query->getArrayResult();
       
	}

	public function findAllReprocessedMineral(){
	   $dql = "SELECT om FROM OreMineral om";
       $query = $this->getEntityManager()->createQuery($dql);

       return $query->getArrayResult();
	}


	public function findAllReprocessingStats(){
	   $dql = "SELECT MAX(om.reprocessingEfficiency) , MIN(om.reprocessingEfficiency) FROM OreMineral om GROUP BY om.mineral";
       $query = $this->getEntityManager()->createQuery($dql);

       return $query->getArrayResult();
	}


}

