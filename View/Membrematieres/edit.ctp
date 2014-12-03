<!-- Fichier: /app/View/Membrematieres/edit.ctp -->

<h1>Editer le membrematiere/h1>
<?php
echo $this->Form->create('Membrematiere');
echo $this->Form->input('moy_mat');
echo $this->Form->input('num_matiere');
echo $this->Form->input('num_membre');
echo $this->Form->input('num_membrematiere', array('type' => 'hidden'));
echo $this->Form->end('Sauvegarder Membrematiere');
?>