<?php
class EdtsController extends AppController{
	public $helpers = array('Html', 'Form');
	public function index(){
		$this->set('edts', $this->Edt->find('all'));		
	}
	
	public function add()
	{
		if($this->request->is('post')) 
		{
			$this->edt->create();
			
			if($this->edt->save($this->request->data))
			{
				$this->Session->setFlash(__('L emploi du temps a été ajouté avec succès'));
				return $this->redirect(array('action' => 'index'));
			}
			
			$this->Session->setFlash(__('L emploi du temps n a pu être ajouté'));
		}
	}
		
	public function edit($num_edt = null)
	{
		if (!$num_edt) 
		{
			throw new NotFoundException(__('edt invalide'));
		}

		$edt = $this->Edt->findByNumEdt($num_edt);
		if (!$edt) 
		{
			throw new NotFoundException(__('edt invalide'));
		}

		if ($this->request->is(array('post', 'put'))) 
		{
			$this->Edt->num_edt = $num_edt;
			if ($this->Edt->save($this->request->data)) {
				$this->Session->setFlash(__('L edt a été mis à jour.'));
				return $this->redirect(array('action' => 'index'));
			}
			$this->Session->setFlash(__('Impossible de modifier l emploi du temps.'));
		}

		if (!$this->request->data) {
			$this->request->data = $edt;
    }
}
	
	
}
?>