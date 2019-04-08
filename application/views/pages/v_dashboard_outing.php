
<!--========================= Content Wrapper ==============================-->
<div class="container">
	<h2>Hi, <?php echo $this->session->userdata("NAME"); ?> </h2>
<!---
-->	



</div>




<div class="container">


					<h1 class="text-info" style="text-align: center">OUTING SLN</h1><br>
						<center>
                            <img src="<?php echo base_url();?>asset/img/logo.png" height="250" width="400">
						</center>		
<!---
-->


<table id="example" class="table table-bordered table-striped"style="width:100%">
        <thead>
            <tr>
        <th>No</th>
        <!-- <th>Tanggal</th> -->
        <th>Nama Kuesioner</th>
        <th>Hadiah</th>
        <!-- <th>User</th> -->
            </tr>
        </thead>
        <tbody>	
			
    <?php
    $no=1;
    if(isset($data_drawing)){
        foreach($data_drawing as $row){
            ?>
            <tr class="gradeX">
                <td><?php echo $no++; ?></td>
                <!-- <td><?php// echo date("Y-m-d H:i:s",strtotime($row->create_at)); ?></td> -->
                <td><?=$row->nama_peserta?></td>
                <td><?=$row->nama_hadiah ?></td>
			
            </tr>
        <?php }
    }
    ?>

        </tbody>
        <tfoot>
            <tr>
        <th>No</th>
        <!-- <th>Tanggal</th> -->
        <th>Nama Peserta</th>
        <th>Nama hadiah</th>
            </tr>
        </tfoot>
    </table>                     

</div>