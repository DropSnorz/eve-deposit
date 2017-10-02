<?php

/**
* @Entity @Table(name="user")
*/
Class User{
        
        /**
        * @Id @Column(type="integer") @GeneratedValue
        * @var int
        */
        protected $id;
        
        /**
        * @Column(type="string")
        * @var string
        */
        protected $username;
        
        /**
        * @Column(type="string")
        * @var string
        */
        protected $password;
        
        
        public function getId() {
                return $this->id;
        }

        public function getUsername() {
                return $this->username;
        }

        public function getPassword() {
                return $this->password;
        }

        public function setUsername($username) {
                $this->username = $username;
        }

        public function setPassword($password) {
                $this->password = $password;
        }
        
}