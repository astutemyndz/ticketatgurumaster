<?php
namespace Illuminate\Models;
class TestModel
{

    public function __construct()
    {
        echo 1;
        exit;
    }
    public function foo() {
        echo "foo";
        exit;
    }
}