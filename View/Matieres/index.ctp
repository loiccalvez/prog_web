<h1>Affichage des matières</h1>
<?php echo $this->Html->link(
    'Ajouter une matière',
    array('controller' => 'matieres', 'action' => 'add')
); ?>
<?php
		echo MatieresController::rien2();
	?>
<table>
    <tr>
        <th>Matière</th>
        <th>Coefficient</th>
		<th>Gestion</th>
    </tr>

    <?php foreach ($matieres as $matiere): ?>
    <tr>
        <td><?php echo $matiere['Matiere']['nom_matiere']; ?></td>
        <td><?php echo $matiere['Matiere']['coeff_matiere']; ?></td>
		<td>
			<?php echo $this->Html->link(
                'Editer',
                array('action' => 'edit', $matiere['Matiere']['num_matiere']));
				echo ' - ';
				echo $this->Form->postLink(
                'Supprimer',
                array('action' => 'delete', $matiere['Matiere']['num_matiere']),
                array('confirm' => 'Etes-vous sûr ?')
            ); ?>
        </td>
    </tr>
    <?php endforeach; ?>
</table>