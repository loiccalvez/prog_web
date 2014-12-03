<!-- File: /app/View/Posts/index.ctp -->

<h1>Connexion d'un membre</h1>
<?php echo $this->Html->link(
    'Se connecter',
    array('controller' => 'edts', 'action' => 'connex')
	); ?>

	
<h1>Blog posts</h1>
<table>
    <tr>
        <th>Id</th>
        <th>semaine</th>
        <th>semestre</th>
        <th>num_groupe</th>
        <th>action</th>
    </tr>

    <!-- Here is where we loop through our $posts array, printing out post info -->

    <?php foreach ($edts as $edt): ?>
	
		<tr>
			<td><?php echo $edt['Edt']['num_edt']; ?></td>
			<td><?php echo $edt['Edt']['semaine']; ?></td>
			<td><?php echo $edt['Edt']['semestre']; ?></td>
			<td><?php echo $edt['Edt']['num_groupe']; ?></td>
			<td>	
				<?php echo $this->Html->link(
					'Editer',
					array('action' => 'edit', $edt['Edt']['num_edt'])
				); ?>
			</td>
		</tr>
		
    <?php endforeach; ?>
    <?php unset($edt); ?>
</table>