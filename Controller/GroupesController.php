<?php

class GroupesController extends AppController{
	public $helpers = array('html','form');
	public $components = array('Session');
	
	public function index() {
		$this->set('groupes',$this->Groupe->find('all'));
	}
	
	public function add() {
	echo 1;
		if ($this->request->is('post')) {
		echo 2;
			$this->Groupe->create();
			if ($this->Groupe->save($this->request->data)) {
			echo 3;
				$this->Session->setFlash(__('Le groupe a été sauvegardé'));
				return $this->redirect(array('action' => 'index'));
			}
		$this->Session->setFlash(__('Impossible de charger le groupe'));
		}
	}
	
	public function edit($num_groupe = null) {
    if (!$num_groupe) {
        throw new NotFoundException(__('Groupe invalide'));
    }

    $groupe = $this->Groupe->findByNumGroupe($num_groupe);
    if (!$groupe) {
        throw new NotFoundException(__('Groupe invalide'));
    }

    if ($this->request->is(array('post', 'put'))) {
        $this->Groupe->num_groupe = $num_groupe;
        if ($this->Groupe->save($this->request->data)) {
            $this->Session->setFlash(__('Le groupe a été mis à jour.'));
            return $this->redirect(array('action' => 'index'));
        }
        $this->Session->setFlash(__('Impossible de modifier le groupe.'));
    }

    if (!$this->request->data) {
        $this->request->data = $groupe;
    }
}
	
	public function delete($num_groupe) {
    if ($this->request->is('get')) {
        throw new MethodNotAllowedException();
    }
    if ($this->Groupe->delete($num_groupe)) {
        $this->Session->setFlash(
            __('Le groupe avec num_groupe : %s a été supprimé.', h($num_groupe))
        );
        return $this->redirect(array('action' => 'index'));
    }
}
}

?>