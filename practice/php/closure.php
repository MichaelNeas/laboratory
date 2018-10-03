function replace_spaces ($text) {
    $replacement = function ($matches) {
        return str_replace ($matches[1], ' ', '&nbsp;').' ';
    };
    return preg_replace_callback ('/( +) /', $replacement, $text);
}
