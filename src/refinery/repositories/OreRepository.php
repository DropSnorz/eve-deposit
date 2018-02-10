<?php
use Doctrine\Common\Collections;
use Doctrine\ORM\EntityRepository;

class OreRepository extends EntityRepository{

	public function findAllPrimaryOreSecondaryRelated()
	{
	   $dql = "SELECT p, s, pom, m FROM PrimaryOre p LEFT JOIN p.secondaryOres s LEFT JOIN p.reprocessedMinerals pom LEFT JOIN pom.mineral m ORDER By p.normalizedPrice DESC";
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

	public function findBestHSOre(){

	   $dql = "SELECT o FROM PrimaryOre o WHERE o.securityLevel > 0.4 AND o.type = 1 AND o.special = 0 ORDER By o.normalizedPrice DESC";
       $query = $this->getEntityManager()->createQuery($dql)->setMaxResults(1);

       return $query->getSingleResult();

	}

	public function findBestLSOre(){
	   $dql = "SELECT o FROM PrimaryOre o WHERE o.type = 1 AND o.special = 0 ORDER By o.normalizedPrice DESC";
       $query = $this->getEntityManager()->createQuery($dql)->setMaxResults(1);

       return $query->getSingleResult();
	}


}

