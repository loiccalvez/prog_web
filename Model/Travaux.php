<?php
class Travaux extends AppModel{
	public $primaryKey='num_travail';
	public $validate = array(
	
		'desc_travail' => array(
			'regle_1' => array(
			'rule'    => array('minLength', '8'),
			'message' => '8 caractères minimum !',
			'last' => false
			),
			'regle_2' => array(
			'rule'    => array('maxLength', '96'),
			'message' => '96 caractères maximum !',
			'last' => false
			)
		),
		
		'progression' => array(
			'regle_1' => array(
			'rule'    => array('minLength', '4'),
			'message' => '4 caractères minimum !',
			'last' => false
			),
			'regle_2' => array(
			'rule'    => array('maxLength', '24'),
			'message' => '24 caractères maximum !',
			'last' => false
			)
		),
		
		'num_membre' => array(
			'regle_1' => array(
			'rule'    => array('minLength', '4'),
			'message' => '4 caractères minimum !',
			'last' => false
			),
			'regle_2' => array(
			'rule'    => array('maxLength', '24'),
			'message' => '24 caractères maximum !',
			'last' => false
			)
		)
		
	
	
	
	
	
	);
}
?>