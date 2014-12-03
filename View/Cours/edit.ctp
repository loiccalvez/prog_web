<!-- Fichier: /app/View/Cours/edit.ctp -->

<h1>Editer le cour</h1>
<?php
echo $this->Form->create('Cour');
echo $this->Form->input('date_cours');
echo $this->Form->input('horaire_deb');
echo $this->Form->input('horaire_fin');
echo $this->Form->input('num_matiere');
echo $this->Form->input('num_edt');
echo $this->Form->input('num_cour', array('type' => 'hidden'));
echo $this->Form->end('Sauvegarder Cour');
?>