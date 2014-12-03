<!-- Fichier : /app/View/Posts/add.ctp -->

<h1>Ajouter un post</h1>
<?php
echo $this->Form->create('Membre');
echo $this->Form->input('nom_membre');
echo $this->Form->input('prenom_membre');
echo $this->Form->end('Sauvegarder le post');
?>