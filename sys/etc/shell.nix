{...}:

{
  programs.bash = {
    promptInit = ''
      PS1="\[\e[34;1;7m\] \w \n\[\e[0;34m\] └▶ \[\e[0m\]" &&\
      printf '\033[35;1m Hi, cutie~\033[0m\n\n'
    '';
    shellAliases = {
      meow = ''cd ~/system/ && vi && \
        printf '\n\033[35;1m Good boys keep their configs clean~\033[0m\n'
      '';
      mrow = ''cd ~/system/ && sudo nixos-rebuild switch --flake ./#vivo && \
        printf '\n\033[35;1m Such an adorable puppy for rebuilding~\033[0m\n'
      '';
      mrrp = ''cd ~/system/ && sudo nix flake update && \
        printf '\n\033[35;1m Such a good girl~\033[0m\n' \
      '';
      purr = ''sudo nix-collect-garbage -d &&\
        printf '\n\033[35;1m A clean kitty is a happy kitty~\033[0m\n'
      '';
    };
  };
}
