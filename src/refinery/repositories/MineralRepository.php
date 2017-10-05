<?php

use Doctrine\ORM\EntityRepository;

class MineralRepository extends EntityRepository{

	public function findAllAsArray()
	{
	   $dql = "SELECT m FROM Mineral m";
       $query = $this->getEntityManager()->createQuery($dql);

       return $query->getArrayResult();
       
	}


}

