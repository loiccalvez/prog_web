<?php

class Bulletin extends AppModel {
	public $primaryKey = 'num_bulletin';
	public $validate = array(
	
        'semestre_bulletin' => array(
			'regle_1' => array(
			'rule'    => array('comparison', '<', 5),
			'required' => true,
			'message' => 'Semestre trop élevée !',
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
		
        'moyenne' => array(
			'regle_1' => array(
			'rule'    => array('comparison', '<', 21),
			'required' => true,
			'message' => 'moyenne trop élevée !',
			'last' => false
			),
        )
    );


}

?>