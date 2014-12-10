<?php

class Amphi extends AppModel {
	public $primaryKey = 'num_amphi';
	public $validate = array(
	
        'date_amphi' => array(
            'rule' => 'notEmpty',
			'required' => true,
			'message' => 'Remplissez ce champ !',
			'last' => false
        ),
		
        'deb_amphi' => array(
            'rule' => 'notEmpty',
			'required' => true,
			'message' => 'Remplissez ce champ !',
			'last' => false
        ),
		
        'fin_amphi' => array(
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
		)
    );

}

?>