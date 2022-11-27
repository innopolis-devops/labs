<?php

require __DIR__ . '/vendor/autoload.php';

include 'healthz.php';

$html = $healthz->html();
echo $html;

?>
