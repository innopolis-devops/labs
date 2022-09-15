<?php
include 'index.php';
use PHPUnit\Framework\TestCase;

final class IndexTest extends TestCase {
    public function test_validate_number() {
        $this->assertEquals(validate_number("123"), true);
        $this->assertEquals(validate_number("12a"), false);
        $this->assertEquals(validate_number("abc#$"), false);
        $this->assertEquals(validate_number(""), false);
    }
}

?>
