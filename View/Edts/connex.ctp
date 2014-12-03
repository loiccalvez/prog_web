	<?php echo $this->Form->create('Membre');
	echo $this->Form->input('login', array(
		'type' => 'text',
		'label' => 'Utilisateur')
	);
	echo $this->Form->input('mdp', array(
		'type' => 'password',
		'label' => 'Mot de passe')
	);
	echo $this->Form->end('Se connecter'); ?>