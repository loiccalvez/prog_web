<?php
class Edt extends AppModel{
	public $primaryKey='num_edt';
	
	// Vérification formulaire
	public $validate =array(
		'edt' => 'text',
		'semaine' => 'text',
		'semestre' => 'text',
		'num_groupe' => 'text'
	);
}
?>
