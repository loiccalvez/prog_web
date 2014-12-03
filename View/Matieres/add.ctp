<h1>Ajouter une matière</h1>
<?php
echo $this->Form->create('Matiere');
echo $this->Form->input('nom_matiere');
echo $this->Form->input('coeff_matiere');
echo $this->Form->end('Ajouter');
?>