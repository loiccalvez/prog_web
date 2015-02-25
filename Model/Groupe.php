<?php

class Groupe extends AppModel {
	public $primaryKey = 'num_groupe';
	public $validate = array(
        'nom_groupe' => array(
            'rule' => 'notEmpty',
			'message' => 'ca bug pls'
        ),
        'typ' => array(
            'rule' => 'notEmpty',
			'message' => 'ca bug pls'
        )
    );


}

?>