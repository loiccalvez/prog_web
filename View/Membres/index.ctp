<h1>Blog membres</h1>
<p><?php echo $this->Html->link(
    'Ajouter un Membre',
    array('action' => 'add')
); ?></p>
<p><?php echo $this->Html->link(
    'Se connecter',
    array('controller' => 'Membres', 'action' => 'login')
); ?></p>
<table>
    <tr>
        <th>num_membre</th>
        <th>prenom_membre</th>
        <th>nom_membre</th>
		<th>Outils</th>
    </tr>

<!-- Ici, nous bouclons sur le tableau $membre afin d'afficher les informations des membres -->

    <?php foreach ($membres as $membre): ?>
    <tr>
        <td><?php echo $membre['Membre']['num_membre']; ?></td>
        <td>
            <?php echo $membre['Membre']['prenom_membre']; ?>
        </td>
		<td>
            <?php echo $membre['Membre']['nom_membre']; ?>
        </td>
        <td>
            <?php echo $this->Form->postLink(
                'Supprimer',
                array('action' => 'delete', $membre['Membre']['num_membre']),
                array('confirm' => 'Etes-vous sûr ?'));
            ?>
            <?php echo $this->Html->link(
                'Editer',
                array('action' => 'edit', $membre['Membre']['num_membre'])
            ); ?>
        </td> 
    </tr>
    <?php endforeach; ?>

</table>