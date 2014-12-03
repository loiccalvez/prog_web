<?php

class AmphisController extends AppController{
	public $helpers = array('html','form');
	public $components = array('Session');
	
	public function index() {
		$this->set('amphis',$this->Amphi->find('all'));
	}
	
	public function add() {
		if ($this->request->is('post')) {
			$this->Amphi->create();
			if ($this->Amphi->save($this->request->data)) {
				$this->Session->setFlash(__('L amphi a été sauvegardé'));
				return $this->redirect(array('action' => 'index'));
			}
		$this->Session->setFlash(__('Impossible de charger l amphi'));
		}
	}
	
	public function edit($num_amphi = null) {
    if (!$num_amphi) {
        throw new NotFoundException(__('Amphi invalide'));
    }

    $amphi = $this->Amphi->findByNumAmphi($num_amphi);
    if (!$amphi) {
        throw new NotFoundException(__('Amphi invalide'));
    }

    if ($this->request->is(array('post', 'put'))) {
        $this->Amphi->num_amphi = $num_amphi;
        if ($this->Amphi->save($this->request->data)) {
            $this->Session->setFlash(__('L Amphi a été mis à jour.'));
            return $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Impossible de modifier l amphi.'));
    }

    if (!$this->request->data) {
        $this->request->data = $amphi;
    }
}
	
	public function delete($num_amphi) {
    if ($this->request->is('get')) {
        throw new MethodNotAllowedException();
    }
    if ($this->Amphi->delete($num_amphi)) {
        $this->Session->setFlash(
            __('L amphi avec num_amphi : %s a été supprimé.', h($num_amphi))
        );
        return $this->redirect(array('action' => 'index'));
    }
}
}

?>