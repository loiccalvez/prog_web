<?php

class Cour extends AppModel {
	public $primaryKey = 'num_cour';
	public $validate = array(
        'date_cours' => array(
            'rule' => 'notEmpty',
			'message' => 'ca bug pls'
        ),
        'horaire_deb' => array(
            'rule' => 'notEmpty',
			'message' => 'ca bug pls'
        ),
		'horaire_fin' => array(
            'rule' => 'notEmpty',
			'message' => 'ca bug pls'
        ),
		'num_matiere' => array(
            'rule' => 'notEmpty',
			'message' => 'ca bug pls'
        ),
		'num_edt' => array(
            'rule' => 'notEmpty',
			'message' => 'ca bug pls'
        )
    );


}

?>