<!-- Fichier: /app/View/Edts/index.ctp -->

<h1>Blog Edt</h1>
<p><?php echo $this->Html->link(
    'Ajouter un edt',
    array('action' => 'add')
); ?></p>
<table>
    <tr>
        <th>num_edt</th>
        <th>semaine</th>
        <th>semestre</th>
        <th>num_groupe</th>
    </tr>

<!-- Ici, nous bouclons sur le tableau $edt afin d'afficher les informations des edts -->

    <?php foreach ($edts as $edt): ?>
    <tr>
        <td><?php echo $edt['Edt']['num_edt']; ?></td>
        <td>
            <?php echo $edt['Edt']['semaine']; ?>
        </td>
        <td>
            <?php echo $edt['Edt']['semestre']; ?>
        </td>
		<td>
            <?php echo $edt['Edt']['num_groupe']; ?>
        </td>
        <td>
            <?php echo $this->Form->postLink(
                'Supprimer',
                array('action' => 'delete', $edt['Edt']['num_edt']),
                array('confirm' => 'Etes-vous sûr ?'));
            ?>
            <?php echo $this->Html->link(
                'Editer',
                array('action' => 'edit', $edt['Edt']['num_edt'])
            ); ?>
        </td> 
    </tr>
    <?php endforeach; ?>

</table>