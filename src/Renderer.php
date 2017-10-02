<?php declare(strict_types = 1);


interface Renderer
{
    public function render($template, $data = []) : string;
}