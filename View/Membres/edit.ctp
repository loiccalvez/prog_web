<!-- Fichier: /app/View/Membres/edit.ctp -->

<h1>Editer le membre</h1>
<?php
echo $this->Form->create('Membre');
echo $this->Form->input('prenom_membre');
echo $this->Form->input('nom_membre');
echo $this->Form->input('login');
echo $this->Form->input('mail');
echo $this->Form->input('num_groupe');
echo $this->Form->input('num_membre', array('type' => 'hidden'));
echo $this->Form->end('Sauvegarder Membre');
?>