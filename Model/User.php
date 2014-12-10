<?php

class User extends AppModel {
	public $primaryKey = 'num_user';
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