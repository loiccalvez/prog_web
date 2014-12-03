<!-- Fichier: /app/View/Membrematieres/index.ctp -->

<h1>Blog membrematieres</h1>
<p><?php echo $this->Html->link(
    'Ajouter un Membrematiere',
    array('action' => 'add')
); ?></p>
<table>
    <tr>
        <th>num_membrematiere</th>
        <th>moy_mat</th>
        <th>num_matiere</th>
		<th>num_membre</th>
    </tr>

<!-- Ici, nous bouclons sur le tableau $matiere afin d'afficher les informations des membrematieres -->

    <?php foreach ($membrematieres as $membrematiere): ?>
    <tr>
        <td><?php echo $membrematiere['Membrematiere']['num_membrematiere']; ?></td>
        <td>
            <?php echo $membrematiere['Membrematiere']['moy_mat']; ?>
        </td>
		<td>
            <?php echo $membrematiere['Membrematiere']['coeff_membrematiere']; ?>
        </td>
        <td>
            <?php echo $this->Form->postLink(
                'Supprimer',
                array('action' => 'delete', $membrematiere['Membrematiere']['num_membrematiere']),
                array('confirm' => 'Etes-vous sûr ?'));
            ?>
            <?php echo $this->Html->link(
                'Editer',
                array('action' => 'edit', $membrematiere['Membrematiere']['num_membrematiere'])
            ); ?>
        </td> 
    </tr>
    <?php endforeach; ?>

</table>