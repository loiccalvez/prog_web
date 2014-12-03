<?php

class CoursController extends AppController{
	public $helpers = array('html','form');
	public $components = array('Session');
	
	public function index() {
		$this->set('cours',$this->Cour->find('all'));
	}
	
	public function add() {
		if ($this->request->is('post')) {
			$this->Cour->create();
			if ($this->Cour->save($this->request->data)) {
				$this->Session->setFlash(__('Le cours a été sauvegardé'));
				return $this->redirect(array('action' => 'index'));
			}
		$this->Session->setFlash(__('Impossible de charger le cours'));
		}
	}
	
	public function edit($num_cour = null) {
    if (!$num_cour) {
        throw new NotFoundException(__('Cours invalide'));
    }

    $cour = $this->Cour->findByNumCour($num_cour);
    if (!$cour) {
        throw new NotFoundException(__('Cours invalide'));
    }

    if ($this->request->is(array('post', 'put'))) {
        $this->Cour->num_cour = $num_cour;
        if ($this->Cour->save($this->request->data)) {
            $this->Session->setFlash(__('Le cours a été mis à jour.'));
            return $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Impossible de modifier le cours.'));
    }

    if (!$this->request->data) {
        $this->request->data = $cour;
    }
}
	
	public function delete($num_cour) {
    if ($this->request->is('get')) {
        throw new MethodNotAllowedException();
    }
    if ($this->Cour->delete($num_cour)) {
        $this->Session->setFlash(
            __('Le cours avec num_cour : %s a été supprimé.', h($num_cour))
        );
        return $this->redirect(array('action' => 'index'));
    }
}
}

?>