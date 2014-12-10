<?php

class Membre extends AppModel {
	public $primaryKey = 'num_membre';
	public $validate = array(
	
        'nom_membre' => array(
           'regle_1' => array(
            'rule' => 'notEmpty',
			'required' => true,
			'message' => 'Remplissez ce champ !',
			'last' => false
			),
			'regle_2' => array(
			'rule'    => array('minLength', '5'),
			'required' => true,
			'message' => '5 caractères minimum !',
			'last' => false
			),
			'regle_3' => array(
            'rule'    => 'alphaNumeric',
			'required' => true,
            'message' => 'Pas de caractères spéciaux !',
			'last' => false
			)
        ),
		
        'prenom_membre' => array(
           'regle_1' => array(
            'rule' => 'notEmpty',
			'required' => true,
			'message' => 'Remplissez ce champ !',
			'last' => false
			),
			'regle_2' => array(
			'rule'    => array('minLength', '3'),
			'required' => true,
			'message' => '3 caractères minimum !',
			'last' => false
			),
			'regle_3' => array(
            'rule'    => 'alphaNumeric',
			'required' => true,
            'message' => 'Pas de caractères spéciaux !',
			'last' => false
			)
        ),
		
		'num_groupe' => array(
           'regle_1' => array(
            'rule' => 'notEmpty',
			'required' => true,
			'message' => 'Remplissez ce champ !',
			'last' => false
			),
           'regle_2' => array(
			'rule'    => array('comparison', '<', 17),
			'required' => true,
			'message' => 'groupe inexistant !',
			'last' => false
			)
		),
    );


}

?>