<h1>Ajouter un EDT</h1>
<?php
	echo $this->Form->create('Edt');
	echo $this->Form->input('semaine');
	echo $this->Form->input('semestre');
	echo $this->Form->input('num_groupe');
	echo $this->Form->end('Sauvegarder l edt');
?>