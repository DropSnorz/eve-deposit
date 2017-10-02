<?php declare(strict_types = 1);

require_once "Renderer.php";

class TwigRenderer implements Renderer
{
    private $renderer;

    public function __construct(Twig_Environment $renderer)
    {
        $this->renderer = $renderer;
    }

    public function render($template, $data = []) : string
    {
    	 $data = array_merge($data, [
            'core' => ['message' => ['exists' => MessageService::hasMessage(),
            					'text' => MessageService::readMessage()['text'],
            					'type' => MessageService::readMessage()['type']]],
        ]);
        return $this->renderer->render($template.".html", $data);
    }
}