<!-- Fichier: /app/View/Amphis/index.ctp -->

<h1>Blog membres</h1>
<p><?php echo $this->Html->link(
    'Ajouter un Amphi',
    array('action' => 'add')
); ?></p>
<table>
    <tr>
        <th>Numéro d'amphi</th>
        <th>Date de l'amphi</th>
        <th>Horaire de début</th>
        <th>Horaire de fin</th>
        <th>Est-ce que l'amphi est un partiel ?</th>
    </tr>

<!-- Ici, nous bouclons sur le tableau $amphi afin d'afficher les informations des membres -->

    <?php foreach ($amphis as $amphi): ?>
    <tr>
        <td><?php echo $amphi['Amphi']['num_amphi']; ?></td>
        <td>
            <?php echo $amphi['Amphi']['date_amphi']; ?>
        </td>
		<td>
            <?php echo $amphi['Amphi']['deb_amphi']; ?>
        </td>		
		<td>
            <?php echo $amphi['Amphi']['fin_amphi']; ?>
        </td>		
		<td>
            <?php echo $amphi['Amphi']['partiel']; ?>
        </td>
		
        <td>
            <?php echo $this->Form->postLink(
                'Supprimer',
                array('action' => 'delete', $amphi['Amphi']['num_amphi']),
                array('confirm' => 'Etes-vous sûr ?'));
            ?>
            <?php echo $this->Html->link(
                'Editer',
                array('action' => 'edit', $amphi['Amphi']['num_amphi'])
            ); ?>
        </td> 
    </tr>
    <?php endforeach; ?>

</table>