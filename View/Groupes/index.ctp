<!-- Fichier: /app/View/Groupes/index.ctp -->

<h1>Blog groupes</h1>
<p><?php echo $this->Html->link(
    'Ajouter un Groupe',
    array('action' => 'add')
); ?></p>
<table>
    <tr>
        <th>num_groupe</th>
        <th>nom_groupe</th>
        <th>type</th>
    </tr>

<!-- Ici, nous bouclons sur le tableau $groupe afin d'afficher les informations des groupes -->

    <?php foreach ($groupes as $groupe): ?>
    <tr>
        <td><?php echo $groupe['Groupe']['num_groupe']; ?></td>
        <td>
            <?php echo $groupe['Groupe']['nom_groupe']; ?>
        </td>
		<td>
            <?php echo $groupe['Groupe']['typ']; ?>
        </td>
        <td>
            <?php echo $this->Form->postLink(
                'Supprimer',
                array('action' => 'delete', $groupe['Groupe']['num_groupe']),
                array('confirm' => 'Etes-vous sûr ?'));
            ?>
            <?php echo $this->Html->link(
                'Editer',
                array('action' => 'edit', $groupe['Groupe']['num_groupe'])
            ); ?>
        </td> 
    </tr>
    <?php endforeach; ?>

</table>