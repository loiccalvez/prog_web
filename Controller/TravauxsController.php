<?php
class TravauxsController extends AppController{
	public $helpers = array('Html', 'Form');
	public function index(){
		/*$ma_variable = $this->Travaux->find('all');
		$ma_seconde_variable = $this->Membre->find
		$this->set('travauxs', $ma_variable);*/
		$db=$this->Travaux->query("SELECT travauxes.num_travail, travauxes.desc_travail, travauxes.echeance, travauxes.progression, matieres.nom_matiere FROM travauxes, matieres WHERE (travauxes.num_matiere = matieres.num_matiere);");
		$this->set('travauxs', $db);

	}
	
	public function view($id) {
		if (!$id) {
            throw new NotFoundException(__('Invalid membre'));
        }

        $travaux = $this->Travaux->findById($id);
        if (!$travaux) {
            throw new NotFoundException(__('Invalid membre'));
        }
        $this->set('travaux', $travaux);
    }
	
	public function mat()
	{
		$db=$this->Travaux->query("SELECT nom_matiere * FROM matieres");
		$this->set('travauxs', $db);
	}
	
	public function add(){
		if($this->request->is('post')) {
			$this->Travaux->create();
			if($this->Travaux->save($this->request->data)) {
				$this->Session->setFlash(__('Le travail a été ajouté avec succès'));
				return $this->redirect(array('action' => 'index'));
			}
			$this->Session->setFlash(__('Le travail n a pu être ajouté'));

		}
	}
	
		// Suppression ok
	public function delete($num_travail) {
		if ($this->request->is('get')) {
			throw new MethodNotAllowedException();
		}
		if ($this->Travaux->delete($num_travail)) {
			$this->Session->setFlash(
				__('Le travail numéro %s a été supprimé.', ($num_travail))
			);
			return $this->redirect(array('action' => 'index'));
		}
	}
	
	public static function rien1()
	{
		return 'Salut';
	}
}
?>