<h1>Ajouter un bulletin</h1>
<?php
echo $this->Form->create('Bulletin');
echo $this->Form->input('semestre_bulletin');
echo $this->Form->input('num_membre');
echo $this->Form->input('moyenne');
echo $this->Form->end('Sauvegarder le bulletin');
?>