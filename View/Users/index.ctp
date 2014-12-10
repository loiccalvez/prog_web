<h1>Blog users</h1>
<p><?php echo $this->Html->link(
    'Ajouter un User',
    array('action' => 'add')
); ?></p>
<table>
    <tr>
        <th>num_user</th>
        <th>prenom_membre</th>
        <th>nom_membre</th>
		<th>Outils</th>
    </tr>

<!-- Ici, nous bouclons sur le tableau $user afin d'afficher les informations des users -->

    <?php foreach ($users as $user): ?>
    <tr>
        <td><?php echo $user['User']['num_user']; ?></td>
        <td>
            <?php echo $user['User']['prenom_membre']; ?>
        </td>
		<td>
            <?php echo $user['User']['nom_membre']; ?>
        </td>
        <td>
            <?php echo $this->Form->postLink(
                'Supprimer',
                array('action' => 'delete', $user['User']['num_user']),
                array('confirm' => 'Etes-vous sûr ?'));
            ?>
            <?php echo $this->Html->link(
                'Editer',
                array('action' => 'edit', $user['User']['num_user'])
            ); ?>
        </td> 
    </tr>
    <?php endforeach; ?>

</table>