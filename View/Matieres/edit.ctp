<h1>Editer la matiere</h1>
<?php
echo $this->Form->create('Matiere');
echo $this->Form->input('nom_matiere');
echo $this->Form->input('coeff_matiere');
echo $this->Form->input('num_matiere', array('type' => 'hidden'));
echo $this->Form->end('Modifier la matière');
?>