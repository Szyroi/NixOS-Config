{...}: {
  services.swaync = {
    enable = true;

    settings = {
      positionX = "right";
      positionY = "top";
      control-center-margin-top = 10;
      control-center-margin-right = 10;
      control-center-width = 400;
      notification-icon-size = 48;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      timeout = 5;
      timeout-low = 2;
      timeout-critical = 0;

      widgets = [
        "title"
        "dnd"
        "notifications"
        "mpris"
        "volume"
        "backlight"
        "buttons-grid"
      ];

      widget-config = {
        title = {
          text = "Benachrichtigungen";
          clear-all-button = true;
          button-text = "Alle löschen";
        };
        dnd = {
          text = "Nicht stören";
        };
        volume = {
          label = "🔊";
        };
        backlight = {
          label = "☀️";
        };
        buttons-grid = {
          actions = [
            {
              label = "🔇 Mute";
              command = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            }
            {
              label = "✈️ DND";
              command = "swaync-client -d -sw";
            }
          ];
        };
      };
    };

    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", sans-serif;
        font-weight: bold;
      }

      .control-center {
        background: rgba(17, 11, 19, 0.85);
        border: 2px solid #89b4fa;
        border-radius: 12px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
      }

      .notification-row {
        outline: none;
        margin: 5px;
      }

      .notification {
        border-radius: 12px;
        background: #1e1e2e;
        color: #cdd6f4;
        border: 1px solid #313244;
      }

      .notification-content {
        padding: 8px;
      }

      .close-button {
        background: #f38ba8;
        color: #11111b;
        text-shadow: none;
        border-radius: 100%;
        margin-top: 5px;
        margin-right: 5px;
      }

      .widget-title {
        color: #89b4fa;
        margin: 10px;
      }

      .widget-title > button {
        background: #313244;
        color: #cdd6f4;
        border-radius: 8px;
      }

      .widget-dnd {
        background: #313244;
        border-radius: 8px;
        margin: 10px;
      }

      .widget-buttons-grid > flowbox > flowboxchild > button {
        background: #313244;
        color: #cdd6f4;
        border-radius: 8px;
        margin: 5px;
      }

      .widget-buttons-grid > flowbox > flowboxchild > button:hover {
        background: #89b4fa;
        color: #11111b;
      }
    '';
  };
}
