# IP Address Management (IPAM)

This document maps out the IP addressing for the homelab network. It is used as a reference for static assignments and for grounding the network management agent.

## Management (VLAN 1)

| IP ADDRESS   | DEVICE TYPE              | DEVICE NAME            | MAKE / MODEL                                                                               | NOTES                          |
|:-------------|:-------------------------|:-----------------------|:-------------------------------------------------------------------------------------------|:-------------------------------|
| 10.1.1.1     | Network Gateway & Router | cbr-hill-router-01     | Ubiquiti Dream Machine Pro (UDM-Pro)                                                       | -                              |
| 10.1.1.11    | Core Switch              | cbr-hill-switch-01     | Ubiquiti Networks Pro HD 24-Port PoE Layer 3 Etherlighting Switch (USW-Pro-HD-24-PoE 600W) | -                              |
| 10.1.1.21    | Wireless Access Point    | cbr-hill-ap-01         | Ubiquiti U7 Pro Wall (U7-Pro-Wall)                                                         | -                              |
| 10.1.1.22    | Wireless Access Point    | cbr-hill-ap-02         | Ubiquiti U7 Pro Wall (U7-Pro-Wall)                                                         | -                              |
| 10.1.1.41    | Virtualisation Host      | cbr-hill-hypervisor-01 | Proxmox Vritualisation Host version 7.2                                                    | AsRock BMC Port                |
| 10.1.1.42    | Virtualisation Host      | cbr-hill-hypervisor-01 | Proxmox Vritualisation Host version 7.2                                                    | Proxmox Remote Management Port |
| 10.1.1.51    | Network Attached Storage | cbr-hill-nas-01-mgmt   | Ubiquiti UNAS Pro 2U Rack Mount NAS (UNAS-PRO)                                             | Management Port                |
| 10.1.1.61    | NVR Server               | cbr-hill-nvr-01-mgmt   | Ubiquiti UNVR UniFi Enterprise Protect 4K NVR (UNVR)                                       | Management Port                |

## Servers (VLAN 10)

| IP ADDRESS   | DEVICE TYPE              | DEVICE NAME            | MAKE / MODEL                                   | NOTES     |
|:-------------|:-------------------------|:-----------------------|:-----------------------------------------------|:----------|
| 10.1.10.41   | Virtualisation Host      | cbr-hill-hypervisor-01 | Proxmox Vritualisation Host version 7.2        | Data Port |
| 10.1.10.51   | Network Attached Storage | cbr-hill-nas-01-data   | Ubiquiti UNAS Pro 2U Rack Mount NAS (UNAS-PRO) | Data Port |

## CCTV (VLAN 50)

| IP ADDRESS   | DEVICE TYPE   | DEVICE NAME          | MAKE / MODEL                                         | NOTES     |
|:-------------|:--------------|:---------------------|:-----------------------------------------------------|:----------|
| 10.1.50.61   | NVR Server    | cbr-hill-nvr-01-data | Ubiquiti UNVR UniFi Enterprise Protect 4K NVR (UNVR) | Data Port |
| 10.1.50.101  | Camera        | cbr-hill-camera-01   | Ubiquiti UniFi G6 Turret Ultra 4K Camera             | -         |
| 10.1.50.102  | Camera        | cbr-hill-camera-02   | Ubiquiti UniFi G6 Turret Ultra 4K Camera             | -         |
| 10.1.50.103  | Camera        | cbr-hill-camera-03   | Ubiquiti UniFi G6 Turret Ultra 4K Camera             | -         |
| 10.1.50.104  | Camera        | cbr-hill-camera-04   | Ubiquiti UniFi G6 Turret Ultra 4K Camera             | -         |
| 10.1.50.105  | Camera        | cbr-hill-camera-05   | Ubiquiti UniFi G6 Turret Ultra 4K Camera             | -         |
| 10.1.50.106  | Camera        | cbr-hill-camera-06   | Ubiquiti UniFi G6 Turret Ultra 4K Camera             | -         |
| 10.1.50.107  | Camera        | cbr-hill-camera-07   | Ubiquiti UniFi G6 Turret Ultra 4K Camera             | -         |
| 10.1.50.108  | Camera        | cbr-hill-camera-08   | Ubiquiti UniFi G6 Turret Ultra 4K Camera             | -         |
| 10.1.50.109  | Camera        | cbr-hill-camera-09   | Ubiquiti UniFi G6 Turret Ultra 4K Camera             | -         |
| 10.1.50.110  | Camera        | cbr-hill-camera-10   | Ubiquiti UniFi G6 Turret Ultra 4K Camera             | -         |

## IoT (VLAN 60)

| IP ADDRESS   | DEVICE TYPE         | DEVICE NAME        | MAKE / MODEL        | NOTES |
|:-------------|:--------------------|:-------------------|:--------------------|:------|
| 10.1.60.11   | Phillips Hue Bridge | cbr-hill-bridge-01 | Phillips Hue Bridge | -     |
