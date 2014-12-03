<!-- Fichier: /app/View/Bulletins/index.ctp -->

<h1>Blog bulletins</h1>
<p><?php echo $this->Html->link(
    'Ajouter un Bulletin',
    array('action' => 'add')
); ?></p>
<table>
    <tr>
        <th>num_bulletin</th>
        <th>semestre_bulletin</th>
        <th>num_membre</th>
		<th>moyenne</th>
    </tr>

<!-- Ici, nous bouclons sur le tableau $bulletin afin d'afficher les informations des bulletins -->

    <?php foreach ($bulletins as $bulletin): ?>
    <tr>
        <td><?php echo $bulletin['Bulletin']['num_bulletin']; ?></td>
        <td>
            <?php echo $bulletin['Bulletin']['semestre_bulletin']; ?>
        </td>
		<td>
            <?php echo $bulletin['Bulletin']['num_membre']; ?>
        </td>
		<td>
            <?php echo $bulletin['Bulletin']['moyenne']; ?>
        </td>
        <td>
            <?php echo $this->Form->postLink(
                'Supprimer',
                array('action' => 'delete', $bulletin['Bulletin']['num_bulletin']),
                array('confirm' => 'Etes-vous sûr ?'));
            ?>
            <?php echo $this->Html->link(
                'Editer',
                array('action' => 'edit', $bulletin['Bulletin']['num_bulletin'])
            ); ?>
        </td> 
    </tr>
    <?php endforeach; ?>

</table>