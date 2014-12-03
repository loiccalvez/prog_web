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

        $membre = $this->Membre->findById($id);
        if (!$membre) {
            throw new NotFoundException(__('Invalid membre'));
        }
        $this->set('travaux', $membre);
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
}
?>