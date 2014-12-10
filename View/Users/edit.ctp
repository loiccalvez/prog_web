<h1>Editer le user</h1>
<?php
echo $this->Form->create('User');
echo $this->Form->input('prenom_membre');
echo $this->Form->input('nom_membre');
echo $this->Form->input('login');
echo $this->Form->input('mail');
echo $this->Form->input('num_groupe');
echo $this->Form->input('num_user', array('type' => 'hidden'));
echo $this->Form->end('Sauvegarder User');
?>