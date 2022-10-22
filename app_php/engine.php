<?php

function validate_number($number) {
    return filter_var($number, FILTER_VALIDATE_INT);
}

?>
