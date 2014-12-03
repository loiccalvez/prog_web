<?php

	class MembresController extends AppController{
	public $helpers = array('html','form');
	public $components = array('Session');
	
	public function index() {
		$this->set('membres',$this->Membre->find('all'));
	}
	
	public function add() {
		if ($this->request->is('post')) {
			$this->Membre->create();
			if ($this->Membre->save($this->request->data)) {
				$this->Session->setFlash(__('Le membre a été sauvegardé'));
				return $this->redirect(array('action' => 'index'));
			}
		$this->Session->setFlash(__('Impossible de charger le membre'));
		}
	}
	
	public function edit($num_membre = null) {
    if (!$num_membre) {
        throw new NotFoundException(__('Membre invalide'));
    }

    $membre = $this->Membre->findByNumMembre($num_membre);
    if (!$membre) {
        throw new NotFoundException(__('Membre invalide'));
    }

    if ($this->request->is(array('post', 'put'))) {
        $this->Membre->num_membre = $num_membre;
        if ($this->Membre->save($this->request->data)) {
            $this->Session->setFlash(__('Le membre a été mis à jour.'));
            return $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Impossible de modifier le membre.'));
    }

    if (!$this->request->data) {
        $this->request->data = $membre;
    }
	}
	
	public function delete($num_membre) {
    if ($this->request->is('get')) {
        throw new MethodNotAllowedException();
    }
    if ($this->Membre->delete($num_membre)) {
        $this->Session->setFlash(
            __('Le membre avec num_membre : %s a été supprimé.', h($num_membre))
        );
        return $this->redirect(array('action' => 'index'));
    }
}
}

?>