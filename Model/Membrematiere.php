<?php

class Membrematiere extends AppModel {
	public $primaryKey = 'num_membrematiere';
	public $validate = array(
	
        'moyenne' => array(
			'regle_1' => array(
			'rule'    => array('comparison', '<', 21),
			'required' => true,
			'message' => 'moyenne trop élevée !',
			'last' => false
			),
		),
		
		'num_matiere' => array(
           'regle_1' => array(
			'rule'    => array('comparison', '<', 111),
			'required' => true,
			'message' => 'matière inexistante !',
			'last' => false
			),
		),
		
		'num_membre' => array(
			'regle_1' => array(
			'rule'    => array('comparison', '<', 131),
			'required' => true,
			'message' => 'membre trop élevée !',
			'last' => false
			),
        ),
		
    );


}

?>