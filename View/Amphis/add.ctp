<h1>Ajouter un amphi</h1>
<?php
	echo $this->Form->create('Amphi');
	echo $this->Form->input('num_amphi');
	echo $this->Form->input('date_amphi');
	echo $this->Form->input('deb_amphi');
	echo $this->Form->input('fin_amphi');
	echo $this->Form->input('partiel');
	echo $this->Form->input('num_matiere');
	echo $this->Form->end('Sauvegarder l amphi');
?>