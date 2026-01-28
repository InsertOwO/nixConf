{config,  ...}:

{
  programs.rofi.theme = builtins.toFile "rofi-theme.rasi" ''
    /* Configuration */
    configuration {
      show-icons:          true;
      display-drun:        " ";
      display-filebrowser: " ";
      display-window:      " ";
      display-powermenu:   " ";
      drun-display-format: "{name}";
      window-format:       "{w} {c} | {t}";
    }

    /* Global Properties */
    * {
      bg:    #${config.pal.bg1};
      txt:   #${config.pal.fg1};
      pri:   #${config.pal.pri1};
    }

    window {
      width:  600px;
    }

    /* Main Box */
    mainbox {
      spacing:          10px;
      border:           3px solid;
      border-color:     @pri;
      text-color:       @txt;
      background-color: @bg;
      children:         ["inputbar", "listview", "message"];
    }

    /* Inputbar */
    inputbar {
      padding:          10px;
      background-color: @bg;
      text-color:       @txt;
      children:         ["textbox-prompt-colon", "entry", "mode-switcher"];
    }

    textbox-prompt-colon {
      expand:           false;
      padding:          5px;
      str:              " ";
      background-color: inherit;
      text-color:       inherit;
    }
    entry {
      padding:          5px;
      placeholder:      "Search...";
      background-color: inherit;
      text-color:       inherit;
    }

    /* Listview */
    listview {
      scrollbar:  true;
      padding:    15;
      columns:    1;
      lines:      8;
      spacing:    5px;
      text-color: inherit;
    }
    scrollbar {
      handle-width:  5px;
      handle-color:  @pri;
    }

    element {
      enabled:       true;
      padding:       4px 2px;
      text-color:    @txt;
    }

    element selected {
      background-color: @pri;
      text-color:       @bg;
    }

    element-text {
      text-color: inherit;
    }

    /* Mode Switcher */
    button {
      background-color: @bg;
      text-color:       @txt;
      padding:          5px;
    }
    button selected {
      background-color: @pri;
      text-color:       @bg;
    }

    /* Message */
    textbox {
      background-color: @bg;
      text-color:       @txt;
      placeholder-color: @txt;
      blink:            true;
      markup:           true;
    }
    error-message {
      padding:          10px;
      border:           2px solid;
      border-color:     @pri;
      background-color: @bg;
      text-color:       @txt;
    }
  '';
}
