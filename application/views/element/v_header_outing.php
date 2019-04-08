<html lang="en">
<head>
    <meta charset="utf-8">
    <title><?php echo $title?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Aplikasi Kuesioner">
    <meta name="author" content="Djava-ui">

    <!-- CSS -->
    <link rel="stylesheet" href="<?php echo base_url('asset/css/bootstrap.css')?>"/>
    <link rel="stylesheet" href="<?php echo base_url('asset/css/bootstrap-responsive.css')?>"/>
    <link rel="stylesheet" href="<?php echo base_url('asset/css/chosen.css')?>"/>
    <link rel="stylesheet" href="<?php echo base_url('asset/css/style.css')?>"/>
    <style type="text/css">
        .chzn-container-single .chzn-search input{
            width: 100%;
        }
    </style>

    <!-- Fav icon -->
    <link rel="shortcut icon" href="<?php echo base_url('asset/img/logo.png')?>">

    <!-- JS -->
    <script type="text/javascript" src="<?php echo base_url('asset/js/jquery.js')?>"></script>
    <script type="text/javascript" src="<?php echo base_url('asset/js/bootstrap.js')?>"></script>
    <script type="text/javascript" src="<?php echo base_url('asset/js/chosen.jquery.js');?>"></script>
    <script type="text/javascript">
        $(function(){
            $('.chzn-select').chosen();
            $('.chzn-select-deselect').chosen({allow_single_deselect:true});
        });

    </script>

</head>

<body>
<div class="container">

    <!--========================= Header + Navbar ==============================-->

        <div class="navbar hidden-print">
            <div class="navbar-inner">
                <div class="container">
                    <ul class="nav">
                        <li class="<?php if(isset($active_dashboard)){echo $active_dashboard ;}?>">
                            <a href="<?php echo site_url('outing/dashboard')?>"><i class="icon-home"></i> Dashboard</a>
                        </li>
                        
                        <!-- <li class="<?php if(isset($active_penjualan)){echo $active_penjualan ;}?>">
                            <a href="<?php echo site_url('quiz/quiz_list')?>"><i class="icon-edit"></i>Report Kuesioner</a>
                        </li> -->

                        <li class="<?php if(isset($active_laporan)){echo $active_laporan ;}?>">
                            <a href="<?php echo site_url('outing/ikut')?>" target="_blank" ><i class="icon-file"></i>PESERTA DRAWING</a>
                        </li>

                        <li class="<?php if(isset($active_laporan)){echo $active_laporan ;}?>">
                            <a href="<?php echo site_url('outing')?>" target="_blank"><i class="icon-file"></i>ALL DRAWING</a>
                        </li>
                        
                        <li class="<?php if(isset($active_master)){echo $active_master ;}?>">
                            <a href="<?php echo site_url('master')?>"><i class="icon-cog"></i> Master Data</a>
                        </li>
                        <li><a href="<?php echo site_url('login/logout')?>" style="background: #333; color: #fff"; target="_blank"><i class="icon-white icon-remove-sign"></i>  Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <br>
