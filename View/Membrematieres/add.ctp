<h1>Ajouter un membrematiere</h1>
<?php
echo $this->Form->create('Membrematiere');
echo $this->Form->input('moy_mat');
echo $this->Form->input('num_matiere');
echo $this->Form->input('num_membre');
echo $this->Form->end('Sauvegarder le membrematiere');
?>