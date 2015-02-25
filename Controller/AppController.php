<?php
/**
 * Application level Controller
 *
 * This file is application-wide controller file. You can put all
 * application-wide controller-related methods here.
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       app.Controller
 * @since         CakePHP(tm) v 0.2.9
 * @license       http://www.opensource.org/licenses/mit-license.php MIT License
 */

App::uses('Controller', 'Controller');

/**
 * Application Controller
 *
 * Add your application-wide methods in the class below, your controllers
 * will inherit them.
 *
 * @package		app.Controller
 * @link		http://book.cakephp.org/2.0/en/controllers.html#the-app-controller
 */
class AppController extends Controller {
    public $components = array(
        'Session',
        'Auth' => array(
            'loginRedirect' => array('controller' => 'membres', 'action' => 'index'),
            'logoutRedirect' => array('controller' => 'pages', 'action' => 'display', 'home'),
			'authorize' => array('Controller')
        )
    );
	
	public function beforeFilter() {
		// $this->Auth->allow('index', 'view'); Redirige vers la page index
		// Permet aux utilisateurs de s'enregistrer et de se déconnecter
		//$this->Auth->allow('add', 'logout');
		if(isset($_COOKIE['membre'])) // Si l'utilisateur est déjà connecté
		{
			$this->Auth->allow('index', 'view');
		}
		else // S'il n'est pas connecté
		{
			$this->Auth->allow('login', 'view');
		}
	}
	
	public function logout() {
		return $this->redirect($this->Auth->logout());
	}
	
	public function login() { // Permet de se connecter
		if(!isset($_COOKIE['membre']))
		{
			if ($this->request->is('post')) {
				$passwd = md5($this->request->data['Membre']['password']);
				$username = $this->request->data['Membre']['username'];
				$db=$this->Membre->query("SELECT membres.nom_membre, membres.prenom_membre, membres.num_groupe FROM membres WHERE username = '$username' AND password = '$passwd';");
				if(empty($db))
					$this->Session->setFlash(__("Nom d'user ou mot de passe invalide, réessayer"));
				else
				{
					setcookie("membre", $username, time()+3600, '/');
					if($db[0]['membres']['num_groupe'] == '16')
						$statut="prof";
					else
						$statut="eleve";
					setcookie("statut", $statut, time()+3600, '/');
					$this->Session->setFlash(__("Connexion effectué avec succès"));
					return $this->redirect(array('controller' => 'membres', 'action' => 'index'));
				}
			}
		}
		else
		{
			$this->Auth->allow('index', 'view');
		}
	}


	public function isAuthorized($user) {
		// Admin peut accéder à toute action
		if (isset($user['role']) && $user['role'] === '11') {
			return true;
		}

		// Refus par défaut
		return false;
	}
}
