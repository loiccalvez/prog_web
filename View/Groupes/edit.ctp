<!-- Fichier: /app/View/Groupes/edit.ctp -->

<h1>Editer le groupe</h1>
<?php
echo $this->Form->create('Groupe');
echo $this->Form->input('nom_groupe');
echo $this->Form->input('typ');
echo $this->Form->input('num_groupe', array('type' => 'hidden'));
echo $this->Form->end('Sauvegarder MGroupe');
?>