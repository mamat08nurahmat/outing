<?php
class Master extends CI_Controller{
    function __construct(){
        parent::__construct();
        if($this->session->userdata('login_status') != TRUE ){
            $this->session->set_flashdata('notif','Maaf, Anda tidak diperbolehkan masuk tanpa login !');
            redirect('');
        };
        $this->load->model('model_app');
        $this->load->helper('currency_format_helper');
    }

    function index(){

        $kd_institusi= $_SESSION['KD_INSTITUSI'];

// print_r($kd_institusi);die();

        if($kd_institusi=='ALL'){

            $data_hadiah =     $this->db->query("
            SELECT 
            h.kd_hadiah,
            h.nama_hadiah,
            i.kd_institusi,
            i.nama_institusi,
            h.stok,
            
            CASE 
            WHEN q.keluar IS NULL THEN 0
            ELSE
            q.keluar
            END
            as
            keluar,
            -- h.stok + keluar
            CASE 
            WHEN h.stok + keluar IS NULL THEN 0
            ELSE
            h.stok + keluar
            END
            as
            total
            FROM hadiah	h
            LEFT JOIN institusi i ON h.kd_institusi=i.kd_institusi 
             LEFT JOIN 
            (
            SELECT q.kd_hadiah,count(q.kd_hadiah) as keluar from kuesioner q
            group by q.kd_hadiah
            ) q on h.kd_hadiah=q.kd_hadiah	
            
            ")->result();

        }
        elseif($kd_institusi=='I-009'){
        
            $data_hadiah =     $this->db->query("
            SELECT 
            h.kd_hadiah,
            h.nama_hadiah,
            i.kd_institusi,
            i.nama_institusi,
            h.stok,
            
            CASE 
            WHEN q.keluar IS NULL THEN 0
            ELSE
            q.keluar
            END
            as
            keluar,
            -- h.stok + keluar
            CASE 
            WHEN h.stok + keluar IS NULL THEN 0
            ELSE
            h.stok + keluar
            END
            as
            total
            FROM hadiah	h
            LEFT JOIN institusi i ON h.kd_institusi=i.kd_institusi 
             LEFT JOIN 
            (
            SELECT q.kd_hadiah,count(q.kd_hadiah) as keluar from drawing q
            group by q.kd_hadiah
            ) q on h.kd_hadiah=q.kd_hadiah
            
            WHERE i.nama_institusi='OUTING'
        
            ")->result();


        }
        else{

//             $where =  "WHERE h.kd_institusi='$kd_institusi'" ;      


  $data_hadiah =     $this->db->query("
            SELECT 
            h.kd_hadiah,
            h.nama_hadiah,
            i.kd_institusi,
            i.nama_institusi,
            h.stok,
            
            CASE 
            WHEN q.keluar IS NULL THEN 0
            ELSE
            q.keluar
            END
            as
            keluar,
            -- h.stok + keluar
            CASE 
            WHEN h.stok + keluar IS NULL THEN 0
            ELSE
            h.stok + keluar
            END
            as
            total
            FROM hadiah	h
            LEFT JOIN institusi i ON h.kd_institusi=i.kd_institusi 
             LEFT JOIN 
            (
            SELECT q.kd_hadiah,count(q.kd_hadiah) as keluar from kuesioner q
            group by q.kd_hadiah
            ) q on h.kd_hadiah=q.kd_hadiah	
            WHERE h.kd_institusi='$kd_institusi'            
            ")->result();
    
        }
        
 



        $data=array(
            'title'=>'Master Data',
            'active_master'=>'active',
//            'kd_produk'=>$this->model_app->getKodeProduk(),
//            'kd_store'=>$this->model_app->getKodeStore(),
            'kd_user'=>$this->model_app->getKodeUser(),
			'kd_hadiah'=>$this->model_app->getKodeHadiah(),
			'kd_institusi'=>$this->model_app->getKodeInstitusi(),
			
 //           'data_produk'=>$this->model_app->getAllData('produk'),
  //          'data_store'=>$this->model_app->getAllData('store'),
            'data_contact'=>$this->model_app->getAllData('contact'),
            'data_user'=>$this->model_app->getAllData('users'),

            'data_institusi'=>$this->db->query("SELECT * FROM institusi	")->result(),
            'data_hadiah'=>$data_hadiah,

            


//             'data_hadiah'=>$this->db->query("
// SELECT h.kd_hadiah,h.kd_institusi,h.stok ,
// CASE 
// WHEN q.keluar IS NULL THEN 0
// ELSE
// q.keluar
// END
// as
// keluar
// FROM hadiah h
// LEFT JOIN 
// (
// SELECT q.kd_hadiah,count(q.kd_hadiah) as keluar from quiz q
// group by q.kd_hadiah
// ) q on h.kd_hadiah=q.kd_hadiah	
// 			")->result(),

			
			
            'data_report_hadiah'=>$this->db->query("
SELECT 
u.nama,h.nama_hadiah,count(q.kd_hadiah) hadiah_keluar,h.stok 
FROM quiz q
inner join hadiah h on q.kd_hadiah=h.kd_hadiah
inner join users u on q.kd_user=u.kd_user
group by u.nama,h.nama_hadiah,h.stok
			")->result()
        );
        

        if($this->session->userdata('KD_INSTITUSI') == 'I-009'){
        $this->load->view('element/v_header_outing',$data);
        }else{
            $this->load->view('element/v_header',$data);
        }

    if ($this->session->userdata('LEVEL') == 'KAE'){
        $this->load->view('pages/v_master');
    }else{
    $this->load->view('errors/index');
    }
        $this->load->view('element/v_footer');
    }
    
//    ===================== INSERT =====================

function tambah_institusi(){
    $data=array(
        'kd_institusi'=>$this->input->post('kd_institusi'),
        'nama_institusi'=>$this->input->post('nama_institusi'),
        'rm'=>$this->input->post('rm'),
       );
    $this->model_app->insertData('institusi',$data);
    redirect("master");
}


    function tambah_hadiah(){
        $data=array(
            'kd_hadiah'=>$this->input->post('kd_hadiah'),
            'nama_hadiah'=>$this->input->post('nama_hadiah'),
            'stok'=>$this->input->post('stok'),
            'kd_institusi'=>$this->input->post('kd_institusi'),
           );
        $this->model_app->insertData('hadiah',$data);
        redirect("master");
    }
	
    function tambah_produk(){
        $data=array(
            'kd_produk'=>$this->input->post('kd_produk'),
            'nm_produk'=>$this->input->post('nm_produk'),
            'stok'=>$this->input->post('stok'),
            'harga'=>$this->input->post('harga'),
        );
        $this->model_app->insertData('produk',$data);
        redirect("master");
    }
    function tambah_store(){
        $data=array(
            'kd_store'=> $this->input->post('kd_store'),
            'nm_store'=>$this->input->post('nm_store'),
            'alamat'=>$this->input->post('alamat'),
            'email'=>$this->input->post('email'),
        );
        $this->model_app->insertData('store',$data);
        redirect("master");
    }
    function tambah_user(){
        $data=array(
            'kd_user'=> $this->input->post('kd_user'),
            'npp'=> $this->input->post('npp'),
            'password'=>md5($this->input->post('password')),
            'nama'=> $this->input->post('nama'),
            'level'=>$this->input->post('level'),
            'kd_institusi'=>$this->input->post('kd_institusi'),
        );
        $this->model_app->insertData('users',$data);
        redirect("master");
    }


//    ======================== EDIT =======================
function edit_institusi(){
    $id['kd_institusi'] = $this->input->post('kd_institusi');
    $data=array(
        'nama_institusi'=>$this->input->post('nama_institusi'),
        'rm'=>$this->input->post('rm'),
    );
    $this->model_app->updateData('institusi',$data,$id);
    redirect("master");
}

    function edit_hadiah(){
        $id['kd_hadiah'] = $this->input->post('kd_hadiah');
        $data=array(
            'nama_hadiah'=>$this->input->post('nama_hadiah'),
            'stok'=>$this->input->post('stok'),
            'kd_institusi'=>$this->input->post('kd_institusi'),            
        );
        $this->model_app->updateData('hadiah',$data,$id);
        redirect("master");
    }
	
    function edit_produk(){
        $id['kd_produk'] = $this->input->post('kd_produk');
        $data=array(
            'nm_produk'=>$this->input->post('nm_produk'),
            'stok'=>$this->input->post('stok'),
            'harga'=>$this->input->post('harga'),
        );
        $this->model_app->updateData('produk',$data,$id);
        redirect("master");
    }
    function edit_store(){
        $id['kd_store'] = $this->input->post('kd_store');
        $data=array(
            'nm_store'=>$this->input->post('nm_store'),
            'alamat'=>$this->input->post('alamat'),
            'email'=>$this->input->post('email'),
        );
        $this->model_app->updateData('store',$data,$id);
        redirect("master");
    }
    function edit_contact(){
        $id['id'] = 1;
        $data=array(
            'nama'=> $this->input->post('nama'),
            'owner'=>$this->input->post('owner'),
            'alamat'=>$this->input->post('alamat'),
            'telp'=>$this->input->post('telp'),
            'email'=>$this->input->post('email'),
            'website'=>$this->input->post('website'),
            'deskripsi'=>$this->input->post('deskripsi'),
        );
        $this->model_app->updateData('contact',$data,$id);
        redirect("master");
    }
    function edit_user(){
        $id['kd_user'] = $this->input->post('kd_user');
        $data=array(
            'npp'=>$this->input->post('npp'),
            'password'=>md5($this->input->post('password')),
            'nama'=> $this->input->post('nama'),
            'level'=>$this->input->post('level'),
            'kd_institusi'=>$this->input->post('kd_institusi'),
        );
        $this->model_app->updateData('users',$data,$id);
        redirect("master");
    }

//    ========================== DELETE =======================
    function hapus_hadiah(){
        $id['kd_hadiah'] = $this->uri->segment(3);
        $this->model_app->deleteData('hadiah',$id);
        redirect("master");
    }

	function hapus_produk(){
        $id['kd_produk'] = $this->uri->segment(3);
        $this->model_app->deleteData('produk',$id);
        redirect("master");
    }
	
    function hapus_store(){
        $id['kd_store'] = $this->uri->segment(3);
        $this->model_app->deleteData('store',$id);
        redirect("master");
    }
    function hapus_user(){
        $id['kd_user'] = $this->uri->segment(3);
        $this->model_app->deleteData('users',$id);
        redirect("master");
    }
}