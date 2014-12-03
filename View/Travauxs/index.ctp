<h1>Affichage des travaux en cours</h1>
<?php echo $this->Html->link(
    'Ajouter un travail',
    array('controller' => 'travauxs', 'action' => 'add')
	); 
	?>
<table>
    <tr>
        <th>Numéro</th>
        <th>Description</th>
        <th>Echéance</th>
        <th>Progression</th>
        <th>Matière</th>
		<th>Outils</th>
    </tr>

    <?php foreach ($travauxs as $travaux): ?>
    <tr>
        <td><?php echo $travaux['travauxes']['num_travail']; ?></td>
        <td><?php echo $travaux['travauxes']['desc_travail']; ?></td>
        <td><?php echo $travaux['travauxes']['echeance']; ?></td>
        <td><?php echo $travaux['travauxes']['progression']; ?></td>
        <td><?php echo $travaux['matieres']['nom_matiere']; ?></td>
		<td>
			<?php echo $this->Html->link(
                'Editer',
                array('action' => 'edit', $travaux['travauxes']['num_travail']));
				echo ' - ';
				echo $this->Form->postLink(
                'Supprimer',
                array('action' => 'delete', $travaux['travauxes']['num_travail']),
                array('confirm' => 'Etes-vous sûr ?')
            ); ?>
        </td>
    </tr>
    <?php endforeach; ?>
    <?php unset($travaux); ?>
</table>