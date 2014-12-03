<?php

class PostsController extends AppController{
	public $helpers = array('html','form');
	
	public function index() {
		$this->set('posts',$this->Post->find('all'));
	}
}

?>