<h1>Ajouter un membre</h1>
<?php
echo $this->Form->create('Membre');
echo $this->Form->input('nom_membre');
echo $this->Form->input('prenom_membre');
echo $this->Form->end('Sauvegarder le membre');
?>