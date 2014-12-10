<?php

class Groupe extends AppModel {
	public $primaryKey = 'num_groupe';
	
	public $validate = array(
	
        'nom_groupe' => array(
           'regle_1' => array(
            'rule' => 'notEmpty',
			'required' => true,
			'message' => 'Remplissez ce champ !',
			'last' => false
			)
		),
        
		'typ' => array(
           'regle_1' => array(
            'rule' => 'notEmpty',
			'required' => true,
			'message' => 'Remplissez ce champ !',
			'last' => false
			),
			'regle_2' => array(
			'rule'    => array('minLength', '1'),
			'required' => true,
			'message' => '1 caractère minimum !',
			'last' => false
			),
			'regle_3' => array(
            'rule'    => 'alphaNumeric',
			'required' => true,
            'message' => 'Pas de caractères spéciaux !',
			'last' => false
			)
		),
    );


}

?>