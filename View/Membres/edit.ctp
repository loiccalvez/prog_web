<h1>Editer le post</h1>
<?php
echo $this->Form->create('Membre');
echo $this->Form->input('num_membre');
echo $this->Form->input('nom_membre');
echo $this->Form->input('prenom_membre');
echo $this->Form->end('Save Post');
?>