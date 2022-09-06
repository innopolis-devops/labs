<?php

echo "<h1>Sum of two numbers</h1>";

echo "<form method='post'>";
echo "<h3>Enter integer numbers in fields</h3>";
echo "<input type='text' name='number1'><br>";
echo "<input type='text' name='number2'><br>";
echo "<button type='submit' name='calculate' class='button'>Calculate</button>";
echo "</form>";

if (isset($_POST["calculate"])) {
    if (!filter_var($_POST["number1"], FILTER_VALIDATE_INT))
        echo "<p style='color: red'>First field contains not integer</p>";
    else if (!filter_var($_POST["number2"], FILTER_VALIDATE_INT))
        echo "<p style='color: red'>Second field contains not integer</p>";
    else {
        $res = intval($_POST["number1"]) + intval($_POST["number2"]);
        echo "<p>Sum of these numbers is: " . $res;
    }
}

?>
