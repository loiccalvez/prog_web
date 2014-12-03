<h1>Editer un travail</h1>
<?php
echo $this->Form->create('Travaux');
echo $this->Form->input('num_travail');
echo $this->Form->input('desc_travail');
echo $this->Form->input('echeance');
echo $this->Form->input('progression');
echo $this->Form->input('num_membre');
echo $this->Form->input('num_travail', array('type' => 'hidden'));
echo $this->Form->end('Sauvegarder le travail');
?>