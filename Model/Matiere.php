<?php
class Matiere extends AppModel{
	public $primaryKey='num_matiere';
	public $validate = array(
	
        'nom_matiere' => array(
           'regle_1' => array(
            'rule' => 'notEmpty',
			'required' => true,
			'message' => 'Remplissez ce champ !',
			'last' => false
			),
			'regle_2' => array(
			'rule'    => array('minLength', '12'),
			'required' => true,
			'message' => '12 caractères minimum !',
			'last' => false
			),
			'regle_3' => array(
			'rule'    => array('maxLength', '96'),
			'required' => true,
			'message' => '96 caractères maximum !',
			'last' => false
			),
			'regle_4' => array(
            'rule'    => 'alphaNumeric',
			'required' => true,
            'message' => 'Pas de caractères spéciaux !',
			'last' => false
			)
        ),
		
		'coeff_matiere' => array(
			'regle_1' => array(
			'rule'    => array('comparison', '<', 5),
			'required' => true,
			'message' => 'coefficient trop élevé !',
			'last' => false
			),
		),
	);
}
?>