{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  # === Bash ===

  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/nix#desktop";
    };

    bashrcExtra = ''
      if command -v fastfetch >/dev/null 2>&1; then
        fastfetch
      fi
      eval "$(starship init bash)"
    '';
  };

  # === Fish ===

  programs.fish = {
    enable = true;
    shellAliases = {
      uwu = "sudo";
      rebuild = "sudo nixos-rebuild switch --flake ~/nix#desktop";
      update = "sudo nix flake update --flake ~/nix";
      java-Main = "javac Main.java && java Main.java";
      java-main = "javac main.java && java main.java";
      java-app = "javac app.java && java app.java";
      java-App = "javac App.java && java App.java";
    };

    shellInit = ''
      set -g fish_greeting ""
      starship init fish | source
    '';

    interactiveShellInit = ''
      # fastfetch nur in interaktiven shells
      if status is-interactive
        fastfetch
      end
    '';

    functions = {
      jrun = ''
        set TASK_DIR $PWD

        # Nach oben laufen bis src gefunden wird
        set SRC $TASK_DIR
        while test (basename $SRC) != "src"
            if test $SRC = "/"
                echo "Kein src-Ordner gefunden."
                return 1
            end
            set SRC (dirname $SRC)
        end

        set OUT (dirname $SRC)/out
        mkdir -p $OUT

        # Nur aktueller Aufgabenordner kompilieren
        javac -d $OUT (find $TASK_DIR -name "*.java")
        if test $status -ne 0
            return 1
        end

        set MAIN (grep -Rsl "public static void main" $TASK_DIR | head -n 1)
        if test -z "$MAIN"
            echo "Keine main()-Methode gefunden."
            return 1
        end

        set PKG (grep -m1 '^package ' $MAIN | sed 's/package \(.*\);/\1/')
        set CLS (basename $MAIN .java)

        java -cp $OUT "$PKG.$CLS"
      '';
    };
  };
}
