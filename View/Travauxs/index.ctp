<h1>Affichage des travaux en cours</h1>
<?php echo $this->Html->link(
    'Ajouter un travail',
    array('controller' => 'travauxs', 'action' => 'add')
	); 
	?>
	<?php
		echo TravauxsController::rien1();
	?>
<table>
    <tr>
        <th>Numéro</th>
        <th>Description</th>
        <th>Echéance</th>
        <th>Progression</th>
        <th>Matière</th>
    </tr>

    <?php foreach ($travauxs as $travaux): ?>
    <tr>
        <td><?php echo $travaux['travauxes']['num_travail']; ?></td>
        <td><?php echo $travaux['travauxes']['desc_travail']; ?></td>
        <td><?php echo $travaux['travauxes']['echeance']; ?></td>
        <td><?php echo $travaux['travauxes']['progression']; ?></td>
        <td><?php echo $travaux['matieres']['nom_matiere']; ?></td>
    </tr>
    <?php endforeach; ?>
    <?php unset($travaux); ?>
</table>