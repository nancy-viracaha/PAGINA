<?php
	
	/**
	 * Clase controlador de drogueria
	 */

	require 'vistas/Registro.php';
	

	class drogueriaController 
	{
		private $vistas;
		
		
		public function __construct()
		{
			$this->vistas = new drogueria;

		}

		
		// Metodo para llamar el proceso de guardado en BD
		public function save()
		{
			//llamado al metodo del modelo que guardará la petición
			$this->vistas->newdrogueria($_REQUEST);
			//Redirección a la Lista principal
			header('Location: ?controller=drogueria');
		}

		
	}