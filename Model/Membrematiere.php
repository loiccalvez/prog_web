<?php

class Membrematiere extends AppModel {
	public $primaryKey = 'num_membrematiere';
	public $validate = array(
        'moy_mat' => array(
            'rule' => 'notEmpty',
			'message' => 'ca bug pls'
        ),
		'num_matiere' => array(
            'rule' => 'notEmpty',
			'message' => 'ca bug pls'
        ),
        'num_membre' => array(
            'rule' => 'notEmpty',
			'message' => 'ca bug pls'
        )
    );


}

?>