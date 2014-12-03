<?php

class Amphi extends AppModel {
	public $primaryKey = 'num_amphi';
	public $validate = array(
        'date_amphi' => array(
            'rule' => 'notEmpty',
			'message' => 'ca bug pls'
        ),
        'deb_amphi' => array(
            'rule' => 'notEmpty',
			'message' => 'ca bug pls'
        ),
        'fin_amphi' => array(
            'rule' => 'notEmpty',
			'message' => 'ca bug pls'
        ),
        'num_matiere' => array(
            'rule' => 'notEmpty',
			'message' => 'ca bug pls'
        )
    );


}

?>