<?php

use Doctrine\ORM\EntityRepository;

class OreRepository extends EntityRepository{

	public function findAllPrimaryOreSecondaryRelated()
	{
	   $dql = "SELECT p, s FROM PrimaryOre p JOIN p.secondaryOres s";
       $query = $this->getEntityManager()->createQuery($dql);

       return $query->getArrayResult();
       
	}


}

