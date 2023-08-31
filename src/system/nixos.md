# Nixos

Things are working very differently in nixos.
I think this is a fairfull summary of the nixos manual
(available at https://nixos.org/manual/nixos/stable/)
for those that just want to skip the small circonstant details.

		... from a long time linux user to others :)

## Update

```
nixos-rebuild switch	### make it default next boot, and switch now (reloading system services but not user's services)
nixos-rebuild test   	### like switch but doesn't generate boot entry
nixos-rebuild boot		### doesn't switch, but make a boot entry
nixos-rebuild switch -p test ### generate into a a submenu labelled as test
nixos-rebuild build 		### just build, to see if it compiles cleanly

nixos-rebuild build-vm   ### to make prior test in a qemu vm

```

### Channels, for update

https://channels.nixos.org/<...>
where <...> is your channel

```
nix-channel --add https://nixos.org/channels/nixos-22.11 nixos ### add a channel
nix-channel --add https://nixos.org/channels/nixos-22.11-small nixos ### a side channel for server 
nixos-rebuild switch --upgrade  ###  and then upgrade the system///  like dist-upgrade on debian
# or in 2 commands
nix-channel --update nixos
nixos-rebuild switch
```

### Configuration
see nix language for syntax
All configuration lives
under `/etc/nixos/*.nix`
and as a `main` => `/etc/nixos/configuration.nix` will be sourced first


```
nixos-option services.xserver.enable ## inspect a module/set configuration option value

```
### Packaging differences

!!!! There is the package manager and there is the os
=> installing on nixos
nix-env -iA nixos.firefox
=> installing on nix package manager (Unix/Linux/Macos/wsl2)

