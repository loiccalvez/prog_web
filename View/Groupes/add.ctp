<h1>Ajouter un groupe</h1>
<?php
echo $this->Form->create('Groupe');
echo $this->Form->input('nom_groupe');
echo $this->Form->input('typ');
echo $this->Form->end('Sauvegarder le groupe');
?>