<?php
class Edt extends AppModel{
	public $primaryKey='num_edt';
	
	// V�rification formulaire
	public $validate =array(
		'edt' => 'text',
		'semaine' => 'text',
		'semestre' => 'text',
		'num_groupe' => 'text'
	);
}
?>
