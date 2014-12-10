<?php

class Edt extends AppModel {
	public $primaryKey = 'num_edt';
	public $validate = array(
        'num_edt' => array(
            'rule' => 'notEmpty',
			'required' => true,
			'message' => 'Remplissez ce champ !',
			'last' => false
        ),
		
		'semaine' => array(
			'regle_1' => array(
			'rule'    => array('comparison', '<', 13),
			'required' => true,
			'message' => 'Semaine trop élevée !',
			'last' => false
			),
		),
		
		'semestre' => array(
			'regle_1' => array(
			'rule'    => array('comparison', '<', 5),
			'required' => true,
			'message' => 'Semestre trop élevée !',
			'last' => false
			),
		),
		
        'num_groupe' => array(
           'regle_1' => array(
			'rule'    => array('comparison', '<', 17),
			'required' => true,
			'message' => 'groupe inexistant !',
			'last' => false
			)
		)
    );


}

?>