<?php

class Cour extends AppModel {
	public $primaryKey = 'num_cour';
	public $validate = array(
	
        'date_cours' => array(
            'rule' => 'notEmpty',
			'required' => true,
			'message' => 'Remplissez ce champ !',
			'last' => false
        ),
		
        'horaire_deb' => array(
            'rule' => 'notEmpty',
			'required' => true,
			'message' => 'Remplissez ce champ !',
			'last' => false
        ),
		
		'horaire_fin' => array(
            'rule' => 'notEmpty',
			'required' => true,
			'message' => 'Remplissez ce champ !',
			'last' => false
        ),
		
		'num_matiere' => array(
           'regle_1' => array(
			'rule'    => array('comparison', '<', 111),
			'required' => true,
			'message' => 'matière inexistante !',
			'last' => false
			),
		),
		
		'num_edt' => array(
           'regle_1' => array(
			'rule'    => array('comparison', '<', 12),
			'required' => true,
			'message' => 'Emploi du temps inexistant !',
			'last' => false
			),
		)
    );


}

?>