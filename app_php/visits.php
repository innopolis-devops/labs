<?php

$storage_file = 'persistent/visits';

$file = fopen($storage_file, "r");
if ($file) {
    while (($line = fgets($file)) !== false) {
        echo $line . "<br>\n";
    }
    fclose($file);
}

?>
