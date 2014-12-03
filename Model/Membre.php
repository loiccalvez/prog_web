<?php

class Membre extends AppModel {
	public $primaryKey = 'num_membre';
	public $validate = array(
        'nom_membre' => array(
            'rule' => 'notEmpty',
			'message' => 'ca bug pls'
        ),
        'prenom_membre' => array(
            'rule' => 'notEmpty',
			'message' => 'ca bug pls'
        )
    );


}

?>