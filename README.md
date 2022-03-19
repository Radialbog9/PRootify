# PRootify
Easy scripts to run Linux distros in PRoot. It's like a virtual machine, but not needing a hypervisor or any root access!

## Usage
Download and run the script:
```
wget -qO - https://raw.githubusercontent.com/Radialbog9/PRootify/main/prootify.sh | bash
```
From there, you can install and remove distros, and automatically add optional features in 1 click.

## How it Works
> PRoot is a user-space implementation of `chroot`, `mount --bind`, and `binfmt_misc`. This means users don't need any privileges or setup to do things like using an arbitrary directory as the new root filesystem...

We use PRoot to be able to run any Linux distro on any Linux system without reinstalls or virtualization.

## Credits
[AnLinux](https://github.com/EXALAB/AnLinux-App/) as the starting point for this project, so thanks to them!