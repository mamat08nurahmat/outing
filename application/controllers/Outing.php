<?php
class Outing extends CI_Controller{
    function __construct(){
        parent::__construct();
        if($this->session->userdata('login_status') != TRUE ){
            $this->session->set_flashdata('notif','Maaf, Anda tidak diperbolehkan masuk tanpa login !');
            redirect('login');
        };
        $this->load->model('model_app');
/*
*/		
//        $this->load->helper('currency_format_helper');
    }



	function index(){

//$kd_institusi = $_SESSION['KD_INSTITUSI'];
// print_r($kd_institusi);die();           

        $data=array(
            'title'=>'Draw Peserta',
            //'active_quiz'=>'active',
			//'kd_kuesioner'=>$kd_kuesioner,
            'data_peserta'=>$this->db->query("SELECT * FROM peserta WHERE is_drawing=0")->result(),
        );
        $data['data_hadiah'] = $this->db->query("SELECT * FROM hadiah WHERE stok >0 ")->result();
        $this->load->view('/pages/v_draw_peserta',$data);  

//next
//        $data['data_hadiah'] = $this->db->query("SELECT * FROM hadiah WHERE stok >0 ")->result();
 //       $this->load->view('/pages/v_tes_draw',$data);  


    }


	function ikut(){

        //$kd_institusi = $_SESSION['KD_INSTITUSI'];
        // print_r($kd_institusi);die();           
        
                $data=array(
                    'title'=>'Draw Peserta',
                    //'active_quiz'=>'active',
                    //'kd_kuesioner'=>$kd_kuesioner,
                    'data_peserta'=>$this->db->query("SELECT * FROM peserta WHERE is_drawing=0 AND is_outing=1")->result(),
                );
                $data['data_hadiah'] = $this->db->query("SELECT * FROM hadiah WHERE stok >0 ")->result();
                $this->load->view('/pages/v_draw_peserta',$data);  
        
        //next
        //        $data['data_hadiah'] = $this->db->query("SELECT * FROM hadiah WHERE stok >0 ")->result();
         //       $this->load->view('/pages/v_tes_draw',$data);  
        
        
            }
        
        


	function draw_hadiah(){

        $id_peserta_draw = $_POST['id_peserta'];
  
//        $id_peserta_draw = 21;
$is_outing2 = $this->db->query("SELECT is_outing FROM peserta WHERE id_peserta='$id_peserta_draw'")->result();
$is_outing=$is_outing2[0]->is_outing;
// print_r($is_outing);die();
$session_outing = $_SESSION['KD_INSTITUSI']; // outing--> I-009 

if($is_outing==1){

    $query_hadiah =  $this->db->query("
    SELECT * FROM hadiah
    WHERE kd_institusi='$session_outing' AND stok >0 
    AND grand_prize IN (0,1)
    
    ")->result();
    
}else{

    $query_hadiah =  $this->db->query("
    SELECT * FROM hadiah
    WHERE kd_institusi='$session_outing' AND stok >0 
    AND grand_prize IN (0)
    
    ")->result();



}





//        print_r($session_outing);die();
//$is_outing2 = $this->db->query("SELECT * FROM peserta WHERE id_peserta='$id_peserta_draw'")->result();




$data['id_peserta'] = $id_peserta_draw;


$data['data_hadiah'] =$query_hadiah;


//		print_r($data);die();


$this->load->view('pages/v_draw_hadiah_outing',$data);	
/*
*/

}



	function submit(){
		
        //print_r($_POST);die();		
        
        $id_peserta = $_POST['kd_peserta'];
        
        // $data = array(
        //     'kd_user'   =>'K-009',
        //     'create_at'  =>  date("Y-m-d H:i:s"),
        //     'kd_peserta'  => 30,
        //     'kd_hadiah'  => 'H-025',
        // );
        
        
	        $data = array(
                'kd_user'   =>$_SESSION['ID'],
                'create_at'  =>  date("Y-m-d H:i:s"),
                'kd_peserta'  => $this->input->post('kd_peserta'),
                'kd_hadiah'  => $this->input->post('kd_hadiah'),
               );
            
            $this->model_app->insertData('drawing',$data);
            //KURANG STOK HADIAH OUTING        
            $this->model_app->getKurangStokHadiah($this->input->post('kd_hadiah'));
            //UPDATE STATUS PESERTA        
            //!!!!!!!!!!!!!		
            $query_hadiah =  $this->db->query("
            UPDATE peserta SET is_drawing=1
            WHERE id_peserta='$id_peserta'
            ");
            
            /*
            */
            redirect("/outing/ikut");
            print_r('submittttttttttt');die();		
	
	}


    public function dashboard(){


        $data=array(
            'title'=>'Data list Drawing',
            'active_penjualan'=>'active',
			
            'data_drawing'=>$this->db->query("
            SELECT d.create_at,p.nama_peserta,h.nama_hadiah
            FROM drawing d
            LEFT JOIN hadiah h ON d.kd_hadiah=h.kd_hadiah
            LEFT JOIN peserta p ON d.kd_peserta=p.id_peserta

			")->result()			
//            'data_penjualan'=>$this->model_app->getAllDataPenjualan(),
        );        
			
		
        // print_r($data);die();
        
        if($this->session->userdata('KD_INSTITUSI') == 'I-009'){
            $this->load->view('element/v_header_outing',$data);
        }else{
            $this->load->view('element/v_header',$data);
            }        
        

        $this->load->view('pages/v_dashboard_outing');
        $this->load->view('element/v_footer');        


    }
//=================================



	
	

	
}
