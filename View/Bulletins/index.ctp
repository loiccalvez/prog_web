<!-- Fichier: /app/View/Bulletins/index.ctp -->

<h1>Blog bulletins</h1>
<p><?php echo $this->Html->link(
    'Ajouter un Bulletin',
    array('action' => 'add')
); ?></p>
<table>
    <tr>
        <th>Numéro de bulletin</th>
        <th>Semestre concerné</th>
        <th>Nom de l'élève concerné</th>
		<th>Prénom de l'élève concerné</th>
		<th>Moyenne</th>
    </tr>

<!-- Ici, nous bouclons sur le tableau $bulletin afin d'afficher les informations des bulletins -->

    <?php foreach ($bulletins as $bulletin): ?>
    <tr>
        <td><?php echo $bulletin['bulletins']['num_bulletin']; ?></td>
        <td>
            <?php echo $bulletin['bulletins']['semestre_bulletin']; ?>
        </td>
		<td>
            <?php echo $bulletin['membres']['nom_membre']; ?>
        </td>
		<td>
            <?php echo $bulletin['membres']['prenom_membre']; ?>
        </td>
		<td>
            <?php echo $bulletin['bulletins']['moyenne']; ?>
        </td>
        <td>
            <?php echo $this->Form->postLink(
                'Supprimer',
                array('action' => 'delete', $bulletin['bulletins']['num_bulletin']),
                array('confirm' => 'Etes-vous sûr ?'));
            ?>
            <?php echo $this->Html->link(
                'Editer',
                array('action' => 'edit', $bulletin['bulletins']['num_bulletin'])
            ); ?>
        </td> 
    </tr>
    <?php endforeach; ?>

</table>