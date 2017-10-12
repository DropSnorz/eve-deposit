<?php

use Doctrine\ORM\EntityRepository;

class OreRepository extends EntityRepository{

	public function findAllPrimaryOreSecondaryRelated()
	{
	   $dql = "SELECT p, s, pom, m FROM PrimaryOre p JOIN p.secondaryOres s LEFT JOIN p.reprocessedMinerals pom LEFT JOIN pom.mineral m";
       $query = $this->getEntityManager()->createQuery($dql);

       return $query->getArrayResult();
       
	}


}

