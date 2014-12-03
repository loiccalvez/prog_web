<h1>Ajouter un post</h1>
<?php
echo $this->Form->create('Travaux');
echo $this->Form->input('num_travail');
echo $this->Form->input('desc_travail');
echo $this->Form->input('echeance');
echo $this->Form->input('progression');
echo $this->Form->input('num_membre');
echo $this->Form->input('num_matiere', array(
	'options' => <?php echo TravauxsController::mat() ?>,
	'empty' => '(choisissez)'));
echo $this->Form->end('Sauvegarder le travail');
?>