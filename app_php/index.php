<?php

require __DIR__ . '/vendor/autoload.php';

include 'healthz.php';
include 'engine.php';

if (isset($_POST["metrics"])) {
    $registry = \Prometheus\CollectorRegistry::getDefault();

    $renderer = new \Prometheus\RenderTextFormat();
    $result = $renderer->render($registry->getMetricFamilySamples());

    header('Content-type: ' . \Prometheus\RenderTextFormat::MIME_TYPE);
    echo $result;
    die();
}

echo "<h1>Sum of two numbers</h1>";

echo "<form method='post'>";
echo "<h3>Enter integer numbers in fields</h3>";
echo "<input type='text' name='number1'><br>";
echo "<input type='text' name='number2'><br>";
echo "<button type='submit' name='calculate' class='button'>Calculate</button>";
echo "</form>";

echo "<form method='post'>";
echo "<button type='submit' name='metrics' class='button'>Metrics</button>";
echo "</form>";

echo "<form method='post'>";
echo "<button type='submit' name='healthcheck' class='button'>Healthcheck</button>";
echo "</form>";

if (isset($_POST["calculate"])) {
    if (!validate_number($_POST["number1"]))
        echo "<p style='color: red'>First field contains not integer</p>";
    else if (!validate_number($_POST["number2"]))
        echo "<p style='color: red'>Second field contains not integer</p>";
    else {
        \Prometheus\CollectorRegistry::getDefault()
            ->getOrRegisterCounter('', 'calc', 'Times the calculate was used')
            ->inc();
        $res = intval($_POST["number1"]) + intval($_POST["number2"]);
        echo "<p>Sum of these numbers is: " . $res;
    }
}

if (isset($_POST["healthcheck"])) {
    $html = $healthz->html();
    echo $html;
}

?>
