<?php if(isset($data_contact)){
foreach ($data_contact as $row){
?>

<form class="form-horizontal" method="post" action="<?php echo site_url('master/edit_contact')?>">
    <div class="control-group">
        <label class="control-label">Team Name</label>
        <div class="controls">
            <input class="input-block-level" name="nama" type="text" value="<?php echo $row->nama?>" required maxlength="30" readonly>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">Description</label>
        <div class="controls">
            <input class="input-block-level" name="deskripsi" type="text" value="<?php echo $row->deskripsi?>" required maxlength="100">
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">Owner</label>
        <div class="controls">
            <input class="input-block-level" name="owner" type="text" value="<?php echo $row->owner?>" required maxlength="30" readonly>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">Phone</label>
        <div class="controls">
            <input class="input-block-level" name="telp" type="number" value="<?php echo $row->telp?>" required maxlength="30">
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">Email</label>
        <div class="controls">
            <input class="input-block-level" name="email" type="email" value="<?php echo $row->email?>" required maxlength="30">
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">Website</label>
        <div class="controls">
            <input class="input-block-level" name="website" type="text" value="<?php echo $row->website?>" required maxlength="50" readonly>
        </div>
    </div>

    <div class="control-group">
        <label class="control-label">Address</label>
        <div class="controls">
            <textarea class="span7" name="alamat"  required readonly><?php echo $row->alamat?></textarea>
        </div>
    </div>

    <input name="id" type="hidden" value="1">
    <div class="control-group">
        <div class="controls">
            <button type="submit" class="btn btn-info"><i class="icon-edit icon-white"></i> Update Contact</button>
        </div>
    </div>
</form>

<?php }
}
?>