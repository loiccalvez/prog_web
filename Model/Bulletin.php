<?php

class Bulletin extends AppModel {
	public $primaryKey = 'num_bulletin';
	public $validate = array(
        'semestre_bulletin' => array(
            'rule' => 'notEmpty',
			'message' => 'ca bug pls'
        ),
		'num_membre' => array(
            'rule' => 'notEmpty',
			'message' => 'ca bug pls'
        ),
        'moyenne' => array(
            'rule' => 'notEmpty',
			'message' => 'ca bug pls'
        )
    );
}

?>