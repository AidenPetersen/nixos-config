{ config, pkgs, ... }:
{
  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = [
    pkgs.rocm-opencl-icd
  ];
}
