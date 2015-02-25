<!-- Fichier : /app/View/Posts/add.ctp -->

<h1>Ajouter un post</h1>
<?php
echo $this->Form->create('Post');
echo $this->Form->input('title');
echo $this->Form->input('body', array('rows' => '3'));
echo $this->Form->end('Sauvegarder le post');
?>