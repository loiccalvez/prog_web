<?php

class EdtsController extends AppController{
	public $helpers = array('html','form');
	public $components = array('Session');
	
	public function index() {
		$this->set('edts',$this->Edt->find('all'));
	}
	
	public function add() {
		if ($this->request->is('post')) {
			$this->Edt->create();
			if ($this->Edt->save($this->request->data)) {
				$this->Session->setFlash(__('L edt a été sauvegardé'));
				return $this->redirect(array('action' => 'index'));
			}
		$this->Session->setFlash(__('Impossible de charger l edt'));
		}
	}
	
	public function edit($num_edt = null) {
    if (!$num_edt) {
        throw new NotFoundException(__('Edt invalide'));
    }

    $edt = $this->Edt->findByNumEdt($num_edt);
    if (!$edt) {
        throw new NotFoundException(__('Edt invalide'));
    }

    if ($this->request->is(array('post', 'put'))) {
        $this->Edt->num_edt = $num_edt;
        if ($this->Edt->save($this->request->data)) {
            $this->Session->setFlash(__('L edt a été mis à jour.'));
            return $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Impossible de modifier l edt.'));
    }

    if (!$this->request->data) {
        $this->request->data = $edt;
    }
}
	
	public function delete($num_edt) {
    if ($this->request->is('get')) {
        throw new MethodNotAllowedException();
    }
    if ($this->Edt->delete($num_edt)) {
        $this->Session->setFlash(
            __('Le edt avec num_edt : %s a été supprimé.', h($num_edt))
        );
        return $this->redirect(array('action' => 'index'));
    }
}
}

?>