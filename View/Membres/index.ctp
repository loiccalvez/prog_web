<!-- File: /app/View/Posts/index.ctp -->
<h1>Connexion d'un membre</h1>
<?php echo $this->Html->link(
    'Se connecter',
    array('controller' => 'membres', 'action' => 'connex')
	); ?>


<h1>Blog posts</h1>
<?php echo $this->Html->link(
    'Ajouter un Membre',
    array('controller' => 'membres', 'action' => 'add')
	); 
	echo $this->Html->link(
	'Editer un membre',
	array('controller' => 'membres', 'action' => 'edit')
	);
	?>
<table>
    <tr>
        <th>Id</th>
        <th>Nom</th>
        <th>Prénom</th>
    </tr>

    <!-- Here is where we loop through our $posts array, printing out post info -->

    <?php foreach ($membres as $membre): ?>
    <tr>
        <td><?php echo $membre['Membre']['num_membre']; ?></td>
        <td><?php echo $membre['Membre']['prenom_membre']; ?></td>
        <td><?php echo $membre['Membre']['nom_membre']; ?></td>
    </tr>
    <?php endforeach; ?>
    <?php unset($membre); ?>
</table>