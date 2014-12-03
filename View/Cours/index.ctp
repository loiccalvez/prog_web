<!-- Fichier: /app/View/Cours/index.ctp -->

<h1>Blog cours</h1>
<p><?php echo $this->Html->link(
    'Ajouter un Cour',
    array('action' => 'add')
); ?></p>
<table>
    <tr>
        <th>Numéro du cours</th>
        <th>Date</th>
        <th>Horaire de début</th>
		<th>Horaire de fin</th>
		<th>Nom de la matière</th>
		<th>num_edt</th>
    </tr>

<!-- Ici, nous bouclons sur le tableau $cour afin d'afficher les informations des cours -->

    <?php foreach ($cours as $cour): ?>
    <tr>
        <td><?php echo $cour['cours']['num_cour']; ?></td>
        <td>
            <?php echo $cour['cours']['date_cours']; ?>
        </td>
		<td>
            <?php echo $cour['cours']['horaire_deb']; ?>
        </td>
		<td>
            <?php echo $cour['cours']['horaire_fin']; ?>
        </td>
		<td>
            <?php echo $cour['matieres']['nom_matiere']; ?>
        </td>
		<td>
            <?php echo $cour['cours']['num_edt']; ?>
        </td>
        <td>
            <?php echo $this->Form->postLink(
                'Supprimer',
                array('action' => 'delete', $cour['cours']['num_cour']),
                array('confirm' => 'Etes-vous sûr ?'));
            ?>
            <?php echo $this->Html->link(
                'Editer',
                array('action' => 'edit', $cour['cours']['num_cour'])
            ); ?>
        </td> 
    </tr>
    <?php endforeach; ?>

</table>