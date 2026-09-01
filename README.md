# NixOS Configuration

Personal NixOS configuration built around **Nix Flakes**, **Home Manager**, and a modular multi-device architecture.

The goal of this configuration is to keep the system maintainable, reusable, and easy to extend across multiple devices. Shared configuration is centralized, while hardware- and device-specific settings remain isolated.

## Architecture

The configuration is divided into several layers:

```text
nixos-config/
├── hosts/        # Individual machines
├── devices/      # Device-specific configuration
├── profiles/     # Reusable system profiles
├── modules/      # Reusable NixOS and Home Manager modules
├── users/        # User-specific configuration
├── secrets/      # Encrypted secrets
│
├── flake.nix
└── flake.lock
```

### Hosts

`hosts/` contains the configuration for each physical machine.

Each host defines which hardware and configuration applies to that specific device.

### Devices

`devices/` contains hardware- or device-specific settings that should not be part of the shared modules.

### Profiles

`profiles/` defines reusable groups of functionality.

Profiles can be combined depending on the purpose of a machine, for example a desktop, laptop, workstation, or gaming system.

### Modules

`modules/` contains the reusable building blocks of the configuration.

```text
modules/
├── nixos/          # System-level configuration
└── home-manager/  # User-level configuration
```

The modules are further organized by their purpose, allowing common functionality to be reused across different hosts and profiles.

### Users

`users/` contains user-specific configuration.

User configuration is kept separate from host configuration so the same user setup can be reused across multiple machines.

### Secrets

`secrets/` contains encrypted secrets used by the configuration.

Secrets are managed separately from the rest of the configuration and are not stored in plaintext.

## Design Goals

The configuration follows a few simple principles:

* **Modular** - functionality is split into reusable modules.
* **Reusable** - shared configuration is defined once.
* **Device-aware** - hardware-specific settings stay isolated.
* **Scalable** - new devices should require minimal configuration.
* **Separation of concerns** - system, user, hardware, and profile configuration are kept separate.

The overall structure can be visualized as:

```text
                         flake.nix
                             │
                   ┌─────────┴─────────┐
                   │                   │
                Host A              Host B
                   │                   │
                Profiles            Profiles
                   │                   │
             ┌─────┼─────┐             │
             │     │     │             │
           base  desktop gaming       base
             │     │                   │
             └─────┴───────────────────┘
                           │
                    NixOS / Home Manager
                           │
                        Modules
                           │
              ┌────────────┴────────────┐
              │                         │
           Shared                   Device-specific
        configuration                configuration
```

This allows common configuration to be defined once while individual hosts can select the profiles and device-specific settings they need.

Adding a new device should therefore require only a small amount of new configuration instead of duplicating the entire system setup.
