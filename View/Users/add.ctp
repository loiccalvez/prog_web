<h1>Ajouter un user</h1>
<?php
echo $this->Form->create('User');
echo $this->Form->input('nom_membre');
echo $this->Form->input('prenom_membre');
echo $this->Form->end('Sauvegarder le user');
?>