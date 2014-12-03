<!-- Fichier : /app/View/Posts/add.ctp -->

<h1>Ajouter un post</h1>

<?php
	echo $this->Form->create('edt');
	echo $this->Form->input('num_edt');
	echo $this->Form->input('semaine');
	echo $this->Form->input('semestre');
	echo $this->Form->input('num_groupe');
	echo $this->Form->end('Sauvegarder l emploi du temps');
?>