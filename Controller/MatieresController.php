<?php
class MatieresController extends AppController{
	public $helpers = array('Html', 'Form');
	
	// Lecture ok !
	public function index() {
        $this->set('matieres', $this->Matiere->find('all'));
    }
	
	// Ajout ok !
	public function add(){
		if($this->request->is('post')) {
			$this->Matiere->create();
			if($this->Matiere->save($this->request->data)) {
				$this->Session->setFlash(__('La matière a été ajouté avec succès'));
				return $this->redirect(array('action' => 'index'));
			}
			$this->Session->setFlash(__('La matière n a pu être ajouté'));

		}
	}
	
	// Mise à jour ok !
	public function edit($num_matiere = null) {
		if (!$num_matiere) {
			throw new NotFoundException(__('La matière est invalide'));
		}

		$matiere = $this->Matiere->findByNumMatiere($num_matiere);
		if (!$matiere) {
			throw new NotFoundException(__('La matière est invalide'));
		}

		if ($this->request->is(array('post', 'put'))) {
			$this->Matiere->num_matiere = $num_matiere;
			if ($this->Matiere->save($this->request->data)) {
				$this->Session->setFlash(__('La matière a été mis à jour.'));
				return $this->redirect(array('action' => 'index'));
			}
			$this->Session->setFlash(__('Impossible de modifier la matière.'));
		}

		if (!$this->request->data) {
			$this->request->data = $matiere;
		}
	}
	
	// Suppression ok
	public function delete($num_matiere) {
		if ($this->request->is('get')) {
			throw new MethodNotAllowedException();
		}
		if ($this->Matiere->delete($num_matiere)) {
			$this->Session->setFlash(
				__('La matière numéro %s a été supprimé.', ($num_matiere))
			);
			return $this->redirect(array('action' => 'index'));
		}
	}
	
	public static function rien2()
	{
		/* $db=Matiere->query("SELECT matieres.nom_matiere FROM  matieres;");
		return $db; */	
	}
}
?>