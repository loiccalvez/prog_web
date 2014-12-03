<?php

class BulletinsController extends AppController{
	public $helpers = array('html','form');
	public $components = array('Session');
	
	public function index() {
		$this->set('bulletins',$this->Bulletin->find('all'));
	}
	
	public function add() {
		if ($this->request->is('post')) {
			$this->Bulletin->create();
			if ($this->Bulletin->save($this->request->data)) {
				$this->Session->setFlash(__('Le bulletin a été sauvegardé'));
				return $this->redirect(array('action' => 'index'));
			}
		$this->Session->setFlash(__('Impossible de charger le bulletin'));
		}
	}
	
	public function edit($num_bulletin = null) {
    if (!$num_bulletin) {
        throw new NotFoundException(__('Bulletin invalide'));
    }

    $bulletin = $this->Bulletin->findByNumBulletin($num_bulletin);
    if (!$bulletin) {
        throw new NotFoundException(__('Bulletin invalide'));
    }

    if ($this->request->is(array('post', 'put'))) {
        $this->Bulletin->num_bulletin = $num_bulletin;
        if ($this->Bulletin->save($this->request->data)) {
            $this->Session->setFlash(__('Le bulletin a été mis à jour.'));
            return $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Impossible de modifier le bulletin.'));
    }

    if (!$this->request->data) {
        $this->request->data = $bulletin;
    }
}
	
	public function delete($num_bulletin) {
    if ($this->request->is('get')) {
        throw new MethodNotAllowedException();
    }
    if ($this->Bulletin->delete($num_bulletin)) {
        $this->Session->setFlash(
            __('Le bulletin avec num_bulletin : %s a été supprimé.', h($num_bulletin))
        );
        return $this->redirect(array('action' => 'index'));
    }
}
}

?>