<?php

class Edt extends AppModel {
	public $primaryKey = 'num_edt';
	public $validate = array(
        'num_edt' => array(
            'rule' => 'notEmpty',
			'message' => 'ca bug pls'
        ),
        'semaine' => array(
            'rule' => 'notEmpty',
			'message' => 'ca bug pls'
        ),
        'semestre' => array(
            'rule' => 'notEmpty',
			'message' => 'ca bug pls'
        ),
        'num_groupe' => array(
            'rule' => 'notEmpty',
			'message' => 'ca bug pls'
        )
    );


}

?>