<?php

	class UsersController extends AppController{
	public $helpers = array('html','form');
	public $components = array('Session');
	
	public function index() {
		$this->set('users',$this->User->find('all'));
	}
	
	public function add() {
		if ($this->request->is('post')) {
			$this->User->create();
			if ($this->User->save($this->request->data)) {
				$this->Session->setFlash(__('Le user a été sauvegardé'));
				return $this->redirect(array('action' => 'index'));
			}
		$this->Session->setFlash(__('Impossible de charger le user'));
		}
	}
	
	public function edit($num_user = null) {
    if (!$num_user) {
        throw new NotFoundException(__('User invalide'));
    }

    $user = $this->User->findByNumUser($num_user);
    if (!$user) {
        throw new NotFoundException(__('User invalide'));
    }

    if ($this->request->is(array('post', 'put'))) {
        $this->User->num_user = $num_user;
        if ($this->User->save($this->request->data)) {
            $this->Session->setFlash(__('Le user a été mis à jour.'));
            return $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Impossible de modifier le user.'));
    }

    if (!$this->request->data) {
        $this->request->data = $user;
    }
	}
	
	public function delete($num_user) {
    if ($this->request->is('get')) {
        throw new MethodNotAllowedException();
    }
    if ($this->User->delete($num_user)) {
        $this->Session->setFlash(
            __('Le user avec num_user : %s a été supprimé.', h($num_user))
        );
        return $this->redirect(array('action' => 'index'));
    }
}
}

?>