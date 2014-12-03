<!-- Fichier: /app/View/Membres/edit.ctp -->

<h1>Editer le edt</h1>
<?php
	echo $this->Form->create('Edt');
	echo $this->Form->input('semaine');
	echo $this->Form->input('semestre');
	echo $this->Form->input('num_groupe');
	echo $this->Form->input('num_edt', array('type' => 'hidden'));
	echo $this->Form->end('Sauvegarder edt');
?>