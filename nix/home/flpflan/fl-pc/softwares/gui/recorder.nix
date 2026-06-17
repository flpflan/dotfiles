{ lib, pkgs, ... }:

{
  # home.packages = with pkgs; [
  #   gpu-screen-recorder
  # ];
  # systemd.user.services.gpu-screen-recorder = {
  #   # Save a video using `killall -SIGUSR1 gpu-screen-recorder` (or any other way to send a SIGUSR1 signal to gpu-screen-recorder)
  #   Unit.Description = "gpu-screen-recorder replay service";
  #   Install.WantedBy = [ "graphical-session.target" ];
  #   Service.ExecStart = "${lib.getExe pkgs.gpu-screen-recorder} -w portal -f 60 -r 60 -k av1 -a 'default_output' -a 'default_input' -c mp4 -q high -o %h/Videos/Replays -restore-portal-session yes -v no";
  # };
}
