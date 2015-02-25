<?php
	if(isset($_COOKIE['membre']))
	{
		$profil=$_COOKIE['statut']; // récupère le cookie
		if($profil=="prof")
		{
			echo "<a href='../amphis/index'>Gestion des Amphis</a> | ";
			echo "<a href='../bulletins/index'>Bulletin</a> | ";
			echo "<a href='../cours/index'>Cours</a> | ";
			echo "<a href='../edts/index'>EDT</a> | ";
			echo "<a href='../groupes/index'>Groupes</a> | ";
			echo "<a href='../matieres/index'>Matières</a> | ";
			echo "<a href='../membres/index'>Membres</a> | ";
			echo "<a href='../travauxs/index'>Travaux</a> | ";
		}
		else
		{
			echo "Profil élève";
		}
	}
	else
		echo 'Vous devez être connecté pour voir le menu';
?>