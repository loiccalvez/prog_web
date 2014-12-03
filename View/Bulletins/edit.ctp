<!-- Fichier: /app/View/Bulletins/edit.ctp -->

<h1>Editer le bulletin</h1>
<?php
echo $this->Form->create('Bulletin');
echo $this->Form->input('semestre_bulletin');
echo $this->Form->input('num_membre');
echo $this->Form->input('moyenne');
echo $this->Form->input('num_bulletin', array('type' => 'hidden'));
echo $this->Form->end('Sauvegarder Bulletin');
?>