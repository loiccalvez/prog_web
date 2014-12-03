<!-- Fichier: /app/View/Cours/index.ctp -->

<h1>Blog cours</h1>
<p><?php echo $this->Html->link(
    'Ajouter un Cour',
    array('action' => 'add')
); ?></p>
<table>
    <tr>
        <th>num_cour</th>
        <th>date_cours</th>
        <th>horaire_deb</th>
		<th>horaire_fin</th>
		<th>num_matiere</th>
		<th>num_edt</th>
    </tr>

<!-- Ici, nous bouclons sur le tableau $cour afin d'afficher les informations des cours -->

    <?php foreach ($cours as $cour): ?>
    <tr>
        <td><?php echo $cour['Cour']['num_cour']; ?></td>
        <td>
            <?php echo $cour['Cour']['date_cours']; ?>
        </td>
		<td>
            <?php echo $cour['Cour']['horaire_deb']; ?>
        </td>
		<td>
            <?php echo $cour['Cour']['horaire_fin']; ?>
        </td>
		<td>
            <?php echo $cour['Cour']['num_matiere']; ?>
        </td>
		<td>
            <?php echo $cour['Cour']['num_edt']; ?>
        </td>
        <td>
            <?php echo $this->Form->postLink(
                'Supprimer',
                array('action' => 'delete', $cour['Cour']['num_cour']),
                array('confirm' => 'Etes-vous sûr ?'));
            ?>
            <?php echo $this->Html->link(
                'Editer',
                array('action' => 'edit', $cour['Cour']['num_cour'])
            ); ?>
        </td> 
    </tr>
    <?php endforeach; ?>

</table>