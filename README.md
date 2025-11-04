[![](https://img.youtube.com/vi/DeYx2exm04M/hqdefault.jpg)](https://youtu.be/DeYx2exm04M)

# Annotate Chicane #

https://github.com/DXC-0/daemonix-niri   Can you determine why he has self-forked or self-ported with a *-niri suffixation?

The repository "daemonix-niri" appears to be a customized version of the "Universal Blue" Fedora Atomic image, intended for the personal workflow of the author ("DXC-0"), incorporating Nix package manager and additional developer tools into a stable, cloud-native Fedora environment[1].

### Purpose of the Self-Fork and Suffix "-niri"
- The repository uses the suffix "*-niri*" likely to distinguish this particular image build, personalization, or configuration variant from either upstream base images (such as "kinoite-main") or other branches of the author's own "Daemonix" project[1].
- There is no explicit documentation explaining the choice of "niri" in the README, but common reasoning for such suffixation in open-source practice includes:
  - Signaling a particular feature set, toolkit bundle, or desktop environment (e.g., sometimes "-niri" is associated with the Niri Wayland compositor, which is an alternative graphical shell—but the README does not confirm or detail this; if DXC-0 uses the Niri compositor, this may explain the naming convention)[1].
  - Denoting a personalized fork, to facilitate ongoing development and ease of differentiation for testing, support, or sharing purposes within different environments or user bases[1].
- The repository README emphasizes this image is designed for DXC-0's personal usage, and is intended to be adapted or rebased by others for specific needs[1].

### Possible Rationale Behind Suffixation
- The absence of explicit explanation for "niri" points to either:
  - Internal nomenclature by the author for their own configuration branch.
  - Reference to additional or intended integration, such as the Niri compositor, possibly for graphical shell or workflow improvements, not yet fully described in the documentation[1].
  - Maintaining modularity for future forks or ports with differing desktop environments or toolsets.

### Forking/Porting Considerations
- Self-forked repositories with suffixes typically aid in upstream/downstream separation, personal project management, or experimental features tracking[1].
- This approach supports collaborative or multi-environment open source development by making variants easily distinguishable.

In summary, "daemonix-niri" is a self-ported variant, likely distinguished by the "*-niri*" suffix to signal a specific configuration, environment, or intended feature integration (possibly the Niri compositor). The precise intent is not fully detailed, but the practice aligns with common open source project management for personal or environment-specific forks[1].

Citations:
[1] GitHub - DXC-0/daemonix-niri https://github.com/DXC-0/daemonix-niri


The "NIRI" tech stack referenced in modern open-source desktop projects (including anything styled as daemonix-niri) centers around the Niri Wayland compositor—a scrollable-tiling window manager for Linux. Here are the key elements:

**Core Technologies:**
- **Niri (Wayland compositor):** Written in Rust, offering an infinitely scrolling tiling layout for windows, optimized for productivity and ultrawide/multi-monitor use.
- **Wayland Protocol:** Modern successor to X11 for graphical display management.
- **KDL Configuration:** Uses KDL for flexible, human-readable config files.
- **GLSL shaders:** For border/effect rendering.

**Companion/Typical Stack Components:**
- **Waybar:** Status bar for Wayland.
- **Fuzzel:** Application launcher.
- **Mako:** Notifications daemon.
- **Alacritty:** Terminal emulator preferred for Wayland compositors.
- **Swaybg, Swaylock, Swayidle:** For backgrounds, screen locking, and power management.
- **xdg-desktop-portal:** For features like screenshots and screen sharing.
- **Polkit, Secret Service:** Privilege escalation and key management facilitation.

**Features/Philosophy:**
- **Scrollable tiling:** Infinite horizontal workspace arrangement.
- **Dynamic workspaces:** Per-monitor workspace "lanes".
- **Touch/mouse gestures, live config reload, and configurable animations.**

**Community/Ecosystem:**
- Active on GitHub and included in several curated open-source lists, with a growing list of utilities for integration.

References:
- [NixOS Niri Wiki](https://wiki.nixos.org/wiki/Niri)
- [ArchWiki Niri](https://wiki.archlinux.org/title/Niri)
- [Awesome Niri](https://github.com/Vortriz/awesome-niri)
- [Niri on ArcoLinuxD](https://www.arcolinuxd.com/niri/)
- [LinuxLinks Niri Overview](https://www.linuxlinks.com/niri-scrollable-tiling-wayland-compositor/)

---
The stack is minimalist but extensible—centering on Niri as a Wayland compositor and integrating open-source utilities to provide a complete tiling desktop experience.






[![Build container image](https://github.com/DXC-0/daemonix/actions/workflows/build.yml/badge.svg)](https://github.com/DXC-0/daemonix/actions/workflows/build.yml)

<h1 align="center">
    <img align="center" width=150 src="icon.png" />
    <br><br>
    Daemonix
</h1>
<p align="center">
  <strong>bootc image</strong>
</p>
<p align="center">
   - Universal Blue supercharged by Nix - </i>
</p>

## 📖 Description

- Custom Image, based on [ublue-os/kinoite-main](https://github.com/ublue-os/main)
- [Nix package manager](https://nixos.org/) included by default (nix-shell, déclarative configs...)
- Obtain more than 120 000 packages with [nixpkgs](https://search.nixos.org/packages)
- Fedora Atomic Base with Selinux activated
- Developpement Stuff (podman, docker, vscode, ghostty ...)
- Install and use any linux binary with native [distrobox](https://distrobox.it/)
- Manage apps with [discover](https://apps.kde.org/fr/discover/) and [nix-software-center](https://github.com/snowfallorg/nix-software-center)

## Advantages over classic Fedora

- Isolated applications with [flatpak](https://docs.flatpak.org/en/latest/basic-concepts.html)
- [Cloud-Native](https://en.wikipedia.org/wiki/Cloud-native_computing) immutable spin powered by [bootc](https://github.com/bootc-dev/bootc)
- Rock solid stable with fresh packets
- Latest Nvidia Drivers
- Easy rollback and rebase
- [RPM-fusion](https://rpmfusion.org/) enabled by default
- [Flathub](https://flathub.org/en/about) enabled by default
- Multimedia Codecs

## Installation

> **Note** : This image is designed for my personnal usage, contact me if you want to adapt.  

Rebase from any Fedora Atomic based distro :

```
sudo rpm-ostree rebase --experimental ostree-unverified-registry:ghcr.io/DXC-0/daemonix:latest
```

To use any additionnal feature use : 

```
daemonix-helper
```

[![Copie-d-ecran-20251029-080825.png](https://i.postimg.cc/NjLZfJHy/Copie-d-ecran-20251029-080825.png)](https://postimg.cc/JsVppQKm)

Manually add nixpkgs unstable channel : 

```
nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --update
```

Documentation : [Nix-Determinate](https://docs.determinate.systems/determinate-nix/), [Homemanager](https://nix-community.github.io/home-manager/), [Flakes](https://zero-to-nix.com/concepts/flakes/)  

-----

- Special Thanks to [#Universal-Blue](https://github.com/ublue-os) and their efforts to improve Linux Desktop.
- Thanks to [#Fedora](https://fedoraproject.org/fr/) and the [#atomic-project](https://fedoramagazine.org/introducing-fedora-atomic-desktops/) upstream
- If you have time, check out [#Bluefin](https://projectbluefin.io/) or [#Bazzite](https://bazzite.gg/) and support them.
