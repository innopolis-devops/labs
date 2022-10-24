<?php

require __DIR__ . '/vendor/autoload.php';

$registry = \Prometheus\CollectorRegistry::getDefault();

$renderer = new \Prometheus\RenderTextFormat();
$result = $renderer->render($registry->getMetricFamilySamples());

header('Content-type: ' . \Prometheus\RenderTextFormat::MIME_TYPE);
echo $result;

?>
