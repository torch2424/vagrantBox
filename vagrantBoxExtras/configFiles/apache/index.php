<style>
h1 {
    text-align: center;
    color: #090909;
    -webkit-transition: opacity 2s ease-in;
    -moz-transition: opacity 2s ease-in;
    -o-transition: opacity 2s ease-in;
    -ms-transition: opacity 2s ease-in;
    transition: opacity 2s ease-in;
}
.center {
    text-align: center;
    margin-left: auto;
    margin-right: auto;
}
</style>
<br>
<br>
<h1>Please go to a repo subdirectory of the vagrant box</h1>
<br>
<br>
<h1>Subdirectories in /html :</h1>
<br>
<?php
//Loop through to find all the folders in /html
$folders = array_filter(glob('*'), 'is_dir');
foreach ($folders as $folder) {
    echo '<a class = "center" href="' . $folder. '">'. $folder. '</a>';
    echo '<br>';
}
unset($folder); // break the reference with the last element
?>
<br>
<?php
phpinfo();
?>
