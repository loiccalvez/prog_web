<?php

class MembrematieresController extends AppController{
	public $helpers = array('html','form');
	public $components = array('Session');
	
	public function index() {
		$this->set('membrematieres',$this->Membrematiere->find('all'));
	}
	
	public function add() {
		if ($this->request->is('post')) {
			$this->Membrematiere->create();
			if ($this->Membrematiere->save($this->request->data)) {
				$this->Session->setFlash(__('Le Membrematiere a été sauvegardé'));
				return $this->redirect(array('action' => 'index'));
			}
		$this->Session->setFlash(__('Impossible de charger le membrematiere'));
		}
	}
	
	public function edit($num_membrematiere = null) {
    if (!$num_membrematiere) {
        throw new NotFoundException(__('Membrematiere invalide'));
    }

    $matiere = $this->Membrematiere->findByNumMembrematiere($num_membrematiere);
    if (!$membrematiere) {
        throw new NotFoundException(__('Membrematiere invalide'));
    }

    if ($this->request->is(array('post', 'put'))) {
        $this->Membrematiere->num_membrematiere = $num_membrematiere;
        if ($this->Membrematiere->save($this->request->data)) {
            $this->Session->setFlash(__('Le membrematiere a été mis à jour.'));
            return $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Impossible de modifier le membrematiere.'));
    }

    if (!$this->request->data) {
        $this->request->data = $membrematiere;
    }
}
	
	public function delete($num_membrematiere) {
    if ($this->request->is('get')) {
        throw new MethodNotAllowedException();
    }
    if ($this->Membrematiere->delete($num_membrematiere)) {
        $this->Session->setFlash(
            __('Le matiere avec num_membrematiere : %s a été supprimé.', h($num_membrematiere))
        );
        return $this->redirect(array('action' => 'index'));
    }
}
}

?>