## Sources
I've used tutorial lab.

### ansible-playbook playbooks/dev/main.yml --diff

```bash
$ ansible-playbook playbooks/dev/main.yml --diff | tail -n 50
TASK [docker : Install Docker packages (with downgrade option).] *********************************************************************************************************
The following additional packages will be installed:
  docker-scan-plugin libltdl7 libslirp0 pigz slirp4netns
0 upgraded, 9 newly installed, 0 to remove and 24 not upgraded.
changed: [bakavm]

TASK [docker : Install docker-compose plugin.] ***************************************************************************************************************************
skipping: [bakavm]

TASK [docker : Install docker-compose-plugin (with downgrade option).] ***************************************************************************************************
skipping: [bakavm]

TASK [docker : Ensure /etc/docker/ directory exists.] ********************************************************************************************************************
skipping: [bakavm]

TASK [docker : Configure Docker daemon options.] *************************************************************************************************************************
skipping: [bakavm]

TASK [docker : Ensure Docker is started and enabled at boot.] ************************************************************************************************************
ok: [bakavm]

TASK [docker : Ensure handlers are notified now to avoid firewall conflicts.] ********************************************************************************************

RUNNING HANDLER [docker : restart docker] ********************************************************************************************************************************
changed: [bakavm]

TASK [docker : include_tasks] ********************************************************************************************************************************************
included: /data/work/iu/devops-labs/ansible/roles/docker/tasks/docker-compose.yml forbakavm 

TASK [docker : Check current docker-compose version.] ********************************************************************************************************************
ok: [bakavm]

TASK [docker : set_fact] *************************************************************************************************************************************************
ok: [bakavm]

TASK [docker : Delete existing docker-compose version if it's different.] ************************************************************************************************
ok: [bakavm]

TASK [docker : Install Docker Compose (if configured).] ******************************************************************************************************************
changed: [bakavm]

TASK [docker : Get docker group info using getent.] **********************************************************************************************************************
skipping: [bakavm]

TASK [docker : Check if there are any users to add to the docker group.] *************************************************************************************************

TASK [docker : include_tasks] ********************************************************************************************************************************************
skipping: [bakavm]

PLAY RECAP ***************************************************************************************************************************************************************
bakavm                         : ok=15   changed=5    unreachable=0    failed=0    skipped=12   rescued=0    ignored=0
```

### ansible-inventory -i inventory/main.yml --list
I deleted all ids, ssh keys and all other sensetive information. 
```bash
$ ansible-inventory -i inventory/main.yml --list
{
    "_meta": {
        "hostvars": {
            "bakavm": {
                "ansible_all_ipv4_addresses": [
                    {
                        "__ansible_unsafe": "10.128.0.23"
                    }
                ],
                "ansible_all_ipv6_addresses": [
                    {
                        "__ansible_unsafe": "fe80::d20d:edff:fe12:3ab1"
                    }
                ],
                "ansible_apparmor": {
                    "status": {
                        "__ansible_unsafe": "enabled"
                    }
                },
                "ansible_architecture": {
                    "__ansible_unsafe": "x86_64"
                },
                "ansible_become": true,
                "ansible_bios_date": {
                    "__ansible_unsafe": "04/01/2014"
                },
                "ansible_bios_vendor": {
                    "__ansible_unsafe": "SeaBIOS"
                },
                "ansible_bios_version": {
                    "__ansible_unsafe": "1.11.1-1"
                },
                "ansible_board_asset_tag": {
                    "__ansible_unsafe": "NA"
                },
                "ansible_board_name": {
                    "__ansible_unsafe": "xeon-gold-6338"
                },
                "ansible_board_serial": {
                    "__ansible_unsafe": ""
                },
                "ansible_board_vendor": {
                    "__ansible_unsafe": "Yandex"
                },
                "ansible_board_version": {
                    "__ansible_unsafe": "pc-q35-yc-2.12"
                },
                "ansible_chassis_asset_tag": {
                    "__ansible_unsafe": "NA"
                },
                "ansible_chassis_serial": {
                    "__ansible_unsafe": "xeon-gold-6338"
                },
                "ansible_chassis_vendor": {
                    "__ansible_unsafe": "Yandex"
                },
                "ansible_chassis_version": {
                    "__ansible_unsafe": "xeon-gold-6338"
                },
                "ansible_cmdline": {
                    "BOOT_IMAGE": {
                        "__ansible_unsafe": "/boot/vmlinuz-5.15.0-47-generic"
                    },
                    "biosdevname": {
                        "__ansible_unsafe": "0"
                    },
                    "console": {
                        "__ansible_unsafe": "ttyS0"
                    },
                    "net.ifnames": {
                        "__ansible_unsafe": "0"
                    },
                    "ro": true,
                    "root": {
                        "__ansible_unsafe": ""
                    }
                },
                "ansible_date_time": {
                    "date": {
                        "__ansible_unsafe": "2022-10-03"
                    },
                    "day": {
                        "__ansible_unsafe": "03"
                    },
                    "epoch": {
                        "__ansible_unsafe": "1664829463"
                    },
                    "epoch_int": {
                        "__ansible_unsafe": "1664829463"
                    },
                    "hour": {
                        "__ansible_unsafe": "20"
                    },
                    "iso8601": {
                        "__ansible_unsafe": "2022-10-03T20:37:43Z"
                    },
                    "iso8601_basic": {
                        "__ansible_unsafe": "20221003T203743766632"
                    },
                    "iso8601_basic_short": {
                        "__ansible_unsafe": "20221003T203743"
                    },
                    "iso8601_micro": {
                        "__ansible_unsafe": "2022-10-03T20:37:43.766632Z"
                    },
                    "minute": {
                        "__ansible_unsafe": "37"
                    },
                    "month": {
                        "__ansible_unsafe": "10"
                    },
                    "second": {
                        "__ansible_unsafe": "43"
                    },
                    "time": {
                        "__ansible_unsafe": "20:37:43"
                    },
                    "tz": {
                        "__ansible_unsafe": "UTC"
                    },
                    "tz_dst": {
                        "__ansible_unsafe": "UTC"
                    },
                    "tz_offset": {
                        "__ansible_unsafe": "+0000"
                    },
                    "weekday": {
                        "__ansible_unsafe": "Monday"
                    },
                    "weekday_number": {
                        "__ansible_unsafe": "1"
                    },
                    "weeknumber": {
                        "__ansible_unsafe": "40"
                    },
                    "year": {
                        "__ansible_unsafe": "2022"
                    }
                },
                "ansible_default_ipv4": {
                    "address": {
                        "__ansible_unsafe": "10.128.0.23"
                    },
                    "alias": {
                        "__ansible_unsafe": "eth0"
                    },
                    "broadcast": {
                        "__ansible_unsafe": ""
                    },
                    "gateway": {
                        "__ansible_unsafe": "10.128.0.1"
                    },
                    "interface": {
                        "__ansible_unsafe": "eth0"
                    },
                    "macaddress": {
                        "__ansible_unsafe": "d0:0d:ed:12:3a:b1"
                    },
                    "mtu": 1500,
                    "netmask": {
                        "__ansible_unsafe": "255.255.255.0"
                    },
                    "network": {
                        "__ansible_unsafe": "10.128.0.0"
                    },
                    "prefix": {
                        "__ansible_unsafe": "24"
                    },
                    "type": {
                        "__ansible_unsafe": "ether"
                    }
                },
                "ansible_default_ipv6": {},
                "ansible_device_links": {
                    "ids": {
                        "vda": [
                            {
                                "__ansible_unsafe": ""
                            }
                        ],
                        "vda1": [
                            {
                                "__ansible_unsafe": ""
                            }
                        ],
                        "vda2": [
                            {
                                "__ansible_unsafe": ""
                            }
                        ]
                    },
                    "labels": {},
                    "masters": {},
                    "uuids": {
                        "vda2": [
                            {
                                "__ansible_unsafe": ""
                            }
                        ]
                    }
                },
                "ansible_devices": {
                    "loop0": {
                        "holders": [],
                        "host": {
                            "__ansible_unsafe": ""
                        },
                        "links": {
                            "ids": [],
                            "labels": [],
                            "masters": [],
                            "uuids": []
                        },
                        "model": null,
                        "partitions": {},
                        "removable": {
                            "__ansible_unsafe": "0"
                        },
                        "rotational": {
                            "__ansible_unsafe": "1"
                        },
                        "sas_address": null,
                        "sas_device_handle": null,
                        "scheduler_mode": {
                            "__ansible_unsafe": "none"
                        },
                        "sectors": {
                            "__ansible_unsafe": "126760"
                        },
                        "sectorsize": {
                            "__ansible_unsafe": "512"
                        },
                        "size": {
                            "__ansible_unsafe": "61.89 MB"
                        },
                        "support_discard": {
                            "__ansible_unsafe": "4096"
                        },
                        "vendor": null,
                        "virtual": 1
                    },
                    "loop1": {
                        "holders": [],
                        "host": {
                            "__ansible_unsafe": ""
                        },
                        "links": {
                            "ids": [],
                            "labels": [],
                            "masters": [],
                            "uuids": []
                        },
                        "model": null,
                        "partitions": {},
                        "removable": {
                            "__ansible_unsafe": "0"
                        },
                        "rotational": {
                            "__ansible_unsafe": "1"
                        },
                        "sas_address": null,
                        "sas_device_handle": null,
                        "scheduler_mode": {
                            "__ansible_unsafe": "none"
                        },
                        "sectors": {
                            "__ansible_unsafe": "129480"
                        },
                        "sectorsize": {
                            "__ansible_unsafe": "512"
                        },
                        "size": {
                            "__ansible_unsafe": "63.22 MB"
                        },
                        "support_discard": {
                            "__ansible_unsafe": "4096"
                        },
                        "vendor": null,
                        "virtual": 1
                    },
                    "loop2": {
                        "holders": [],
                        "host": {
                            "__ansible_unsafe": ""
                        },
                        "links": {
                            "ids": [],
                            "labels": [],
                            "masters": [],
                            "uuids": []
                        },
                        "model": null,
                        "partitions": {},
                        "removable": {
                            "__ansible_unsafe": "0"
                        },
                        "rotational": {
                            "__ansible_unsafe": "1"
                        },
                        "sas_address": null,
                        "sas_device_handle": null,
                        "scheduler_mode": {
                            "__ansible_unsafe": "none"
                        },
                        "sectors": {
                            "__ansible_unsafe": "163736"
                        },
                        "sectorsize": {
                            "__ansible_unsafe": "512"
                        },
                        "size": {
                            "__ansible_unsafe": "79.95 MB"
                        },
                        "support_discard": {
                            "__ansible_unsafe": "4096"
                        },
                        "vendor": null,
                        "virtual": 1
                    },
                    "loop3": {
                        "holders": [],
                        "host": {
                            "__ansible_unsafe": ""
                        },
                        "links": {
                            "ids": [],
                            "labels": [],
                            "masters": [],
                            "uuids": []
                        },
                        "model": null,
                        "partitions": {},
                        "removable": {
                            "__ansible_unsafe": "0"
                        },
                        "rotational": {
                            "__ansible_unsafe": "1"
                        },
                        "sas_address": null,
                        "sas_device_handle": null,
                        "scheduler_mode": {
                            "__ansible_unsafe": "none"
                        },
                        "sectors": {
                            "__ansible_unsafe": "210912"
                        },
                        "sectorsize": {
                            "__ansible_unsafe": "512"
                        },
                        "size": {
                            "__ansible_unsafe": "102.98 MB"
                        },
                        "support_discard": {
                            "__ansible_unsafe": "4096"
                        },
                        "vendor": null,
                        "virtual": 1
                    },
                    "loop4": {
                        "holders": [],
                        "host": {
                            "__ansible_unsafe": ""
                        },
                        "links": {
                            "ids": [],
                            "labels": [],
                            "masters": [],
                            "uuids": []
                        },
                        "model": null,
                        "partitions": {},
                        "removable": {
                            "__ansible_unsafe": "0"
                        },
                        "rotational": {
                            "__ansible_unsafe": "1"
                        },
                        "sas_address": null,
                        "sas_device_handle": null,
                        "scheduler_mode": {
                            "__ansible_unsafe": "none"
                        },
                        "sectors": {
                            "__ansible_unsafe": "0"
                        },
                        "sectorsize": {
                            "__ansible_unsafe": "512"
                        },
                        "size": {
                            "__ansible_unsafe": "0.00 Bytes"
                        },
                        "support_discard": {
                            "__ansible_unsafe": "4096"
                        },
                        "vendor": null,
                        "virtual": 1
                    },
                    "loop5": {
                        "holders": [],
                        "host": {
                            "__ansible_unsafe": ""
                        },
                        "links": {
                            "ids": [],
                            "labels": [],
                            "masters": [],
                            "uuids": []
                        },
                        "model": null,
                        "partitions": {},
                        "removable": {
                            "__ansible_unsafe": "0"
                        },
                        "rotational": {
                            "__ansible_unsafe": "1"
                        },
                        "sas_address": null,
                        "sas_device_handle": null,
                        "scheduler_mode": {
                            "__ansible_unsafe": "none"
                        },
                        "sectors": {
                            "__ansible_unsafe": "98288"
                        },
                        "sectorsize": {
                            "__ansible_unsafe": "512"
                        },
                        "size": {
                            "__ansible_unsafe": "47.99 MB"
                        },
                        "support_discard": {
                            "__ansible_unsafe": "4096"
                        },
                        "vendor": null,
                        "virtual": 1
                    },
                    "loop6": {
                        "holders": [],
                        "host": {
                            "__ansible_unsafe": ""
                        },
                        "links": {
                            "ids": [],
                            "labels": [],
                            "masters": [],
                            "uuids": []
                        },
                        "model": null,
                        "partitions": {},
                        "removable": {
                            "__ansible_unsafe": "0"
                        },
                        "rotational": {
                            "__ansible_unsafe": "1"
                        },
                        "sas_address": null,
                        "sas_device_handle": null,
                        "scheduler_mode": {
                            "__ansible_unsafe": "none"
                        },
                        "sectors": {
                            "__ansible_unsafe": "98272"
                        },
                        "sectorsize": {
                            "__ansible_unsafe": "512"
                        },
                        "size": {
                            "__ansible_unsafe": "47.98 MB"
                        },
                        "support_discard": {
                            "__ansible_unsafe": "4096"
                        },
                        "vendor": null,
                        "virtual": 1
                    },
                    "loop7": {
                        "holders": [],
                        "host": {
                            "__ansible_unsafe": ""
                        },
                        "links": {
                            "ids": [],
                            "labels": [],
                            "masters": [],
                            "uuids": []
                        },
                        "model": null,
                        "partitions": {},
                        "removable": {
                            "__ansible_unsafe": "0"
                        },
                        "rotational": {
                            "__ansible_unsafe": "1"
                        },
                        "sas_address": null,
                        "sas_device_handle": null,
                        "scheduler_mode": {
                            "__ansible_unsafe": "none"
                        },
                        "sectors": {
                            "__ansible_unsafe": "0"
                        },
                        "sectorsize": {
                            "__ansible_unsafe": "512"
                        },
                        "size": {
                            "__ansible_unsafe": "0.00 Bytes"
                        },
                        "support_discard": {
                            "__ansible_unsafe": "4096"
                        },
                        "vendor": null,
                        "virtual": 1
                    },
                    "vda": {
                        "holders": [],
                        "host": {
                            "__ansible_unsafe": "SCSI storage controller: Red Hat, Inc. Virtio block device"
                        },
                        "links": {
                            "ids": [
                                {
                                    "__ansible_unsafe": ""
                                }
                            ],
                            "labels": [],
                            "masters": [],
                            "uuids": []
                        },
                        "model": null,
                        "partitions": {
                            "vda1": {
                                "holders": [],
                                "links": {
                                    "ids": [
                                        {
                                            "__ansible_unsafe": ""
                                        }
                                    ],
                                    "labels": [],
                                    "masters": [],
                                    "uuids": []
                                },
                                "sectors": {
                                    "__ansible_unsafe": "2048"
                                },
                                "sectorsize": 512,
                                "size": {
                                    "__ansible_unsafe": "1.00 MB"
                                },
                                "start": {
                                    "__ansible_unsafe": "2048"
                                },
                                "uuid": null
                            },
                            "vda2": {
                                "holders": [],
                                "links": {
                                    "ids": [
                                        {
                                            "__ansible_unsafe": "2"
                                        }
                                    ],
                                    "labels": [],
                                    "masters": [],
                                    "uuids": [
                                        {
                                            "__ansible_unsafe": ""
                                        }
                                    ]
                                },
                                "sectors": {
                                    "__ansible_unsafe": "31453151"
                                },
                                "sectorsize": 512,
                                "size": {
                                    "__ansible_unsafe": "15.00 GB"
                                },
                                "start": {
                                    "__ansible_unsafe": "4096"
                                },
                                "uuid": {
                                    "__ansible_unsafe": ""
                                }
                            }
                        },
                        "removable": {
                            "__ansible_unsafe": "0"
                        },
                        "rotational": {
                            "__ansible_unsafe": "1"
                        },
                        "sas_address": null,
                        "sas_device_handle": null,
                        "scheduler_mode": {
                            "__ansible_unsafe": "none"
                        },
                        "sectors": {
                            "__ansible_unsafe": "31457280"
                        },
                        "sectorsize": {
                            "__ansible_unsafe": "512"
                        },
                        "size": {
                            "__ansible_unsafe": "15.00 GB"
                        },
                        "support_discard": {
                            "__ansible_unsafe": "0"
                        },
                        "vendor": {
                            "__ansible_unsafe": "0x1af4"
                        },
                        "virtual": 1
                    }
                },
                "ansible_distribution": {
                    "__ansible_unsafe": "Ubuntu"
                },
                "ansible_distribution_file_parsed": true,
                "ansible_distribution_file_path": {
                    "__ansible_unsafe": "/etc/os-release"
                },
                "ansible_distribution_file_variety": {
                    "__ansible_unsafe": "Debian"
                },
                "ansible_distribution_major_version": {
                    "__ansible_unsafe": "22"
                },
                "ansible_distribution_release": {
                    "__ansible_unsafe": "jammy"
                },
                "ansible_distribution_version": {
                    "__ansible_unsafe": "22.04"
                },
                "ansible_dns": {
                    "nameservers": [
                        {
                            "__ansible_unsafe": "127.0.0.53"
                        }
                    ],
                    "options": {
                        "edns0": true,
                        "trust-ad": true
                    },
                    "search": [
                        {
                            "__ansible_unsafe": "ru-central1.internal"
                        },
                        {
                            "__ansible_unsafe": "auto.internal"
                        }
                    ]
                },
                "ansible_domain": {
                    "__ansible_unsafe": "ru-central1.internal"
                },
                "ansible_effective_group_id": 0,
                "ansible_effective_user_id": 0,
                "ansible_env": {
                    "HOME": {
                        "__ansible_unsafe": "/root"
                    },
                    "LANG": {
                        "__ansible_unsafe": "en_US.UTF-8"
                    },
                    "LC_CTYPE": {
                        "__ansible_unsafe": "C.UTF-8"
                    },
                    "LOGNAME": {
                        "__ansible_unsafe": "root"
                    },
                    "MAIL": {
                        "__ansible_unsafe": "/var/mail/root"
                    },
                    "PATH": {
                        "__ansible_unsafe": ""
                    },
                    "PWD": {
                        "__ansible_unsafe": "/home/test"
                    },
                    "SHELL": {
                        "__ansible_unsafe": "/bin/bash"
                    },
                    "SUDO_COMMAND": {
                        "__ansible_unsafe": "/bin/sh -c echo BECOME-SUCCESS ; /usr/bin/python3"
                    },
                    "SUDO_GID": {
                        "__ansible_unsafe": "1001"
                    },
                    "SUDO_UID": {
                        "__ansible_unsafe": "1000"
                    },
                    "SUDO_USER": {
                        "__ansible_unsafe": "test"
                    },
                    "TERM": {
                        "__ansible_unsafe": "unknown"
                    },
                    "USER": {
                        "__ansible_unsafe": "root"
                    }
                },
                "ansible_eth0": {
                    "active": true,
                    "device": {
                        "__ansible_unsafe": "eth0"
                    },
                    "features": {
                        "esp_hw_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "esp_tx_csum_hw_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "fcoe_mtu": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "generic_receive_offload": {
                            "__ansible_unsafe": "on"
                        },
                        "generic_segmentation_offload": {
                            "__ansible_unsafe": "on"
                        },
                        "highdma": {
                            "__ansible_unsafe": "on [fixed]"
                        },
                        "hsr_dup_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "hsr_fwd_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "hsr_tag_ins_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "hsr_tag_rm_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "hw_tc_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "l2_fwd_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "large_receive_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "loopback": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "macsec_hw_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "netns_local": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "ntuple_filters": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "receive_hashing": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "rx_all": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "rx_checksumming": {
                            "__ansible_unsafe": "on [fixed]"
                        },
                        "rx_fcs": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "rx_gro_hw": {
                            "__ansible_unsafe": "on"
                        },
                        "rx_gro_list": {
                            "__ansible_unsafe": "off"
                        },
                        "rx_udp_gro_forwarding": {
                            "__ansible_unsafe": "off"
                        },
                        "rx_udp_tunnel_port_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "rx_vlan_filter": {
                            "__ansible_unsafe": "on [fixed]"
                        },
                        "rx_vlan_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "rx_vlan_stag_filter": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "rx_vlan_stag_hw_parse": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "scatter_gather": {
                            "__ansible_unsafe": "on"
                        },
                        "tcp_segmentation_offload": {
                            "__ansible_unsafe": "on"
                        },
                        "tls_hw_record": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tls_hw_rx_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tls_hw_tx_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_checksum_fcoe_crc": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_checksum_ip_generic": {
                            "__ansible_unsafe": "on"
                        },
                        "tx_checksum_ipv4": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_checksum_ipv6": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_checksum_sctp": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_checksumming": {
                            "__ansible_unsafe": "on"
                        },
                        "tx_esp_segmentation": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_fcoe_segmentation": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_gre_csum_segmentation": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_gre_segmentation": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_gso_list": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_gso_partial": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_gso_robust": {
                            "__ansible_unsafe": "on [fixed]"
                        },
                        "tx_ipxip4_segmentation": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_ipxip6_segmentation": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_lockless": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_nocache_copy": {
                            "__ansible_unsafe": "off"
                        },
                        "tx_scatter_gather": {
                            "__ansible_unsafe": "on"
                        },
                        "tx_scatter_gather_fraglist": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_sctp_segmentation": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_tcp6_segmentation": {
                            "__ansible_unsafe": "on"
                        },
                        "tx_tcp_ecn_segmentation": {
                            "__ansible_unsafe": "on"
                        },
                        "tx_tcp_mangleid_segmentation": {
                            "__ansible_unsafe": "off"
                        },
                        "tx_tcp_segmentation": {
                            "__ansible_unsafe": "on"
                        },
                        "tx_tunnel_remcsum_segmentation": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_udp_segmentation": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_udp_tnl_csum_segmentation": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_udp_tnl_segmentation": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_vlan_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_vlan_stag_hw_insert": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "vlan_challenged": {
                            "__ansible_unsafe": "off [fixed]"
                        }
                    },
                    "hw_timestamp_filters": [],
                    "ipv4": {
                        "address": {
                            "__ansible_unsafe": "10.128.0.23"
                        },
                        "broadcast": {
                            "__ansible_unsafe": ""
                        },
                        "netmask": {
                            "__ansible_unsafe": "255.255.255.0"
                        },
                        "network": {
                            "__ansible_unsafe": "10.128.0.0"
                        },
                        "prefix": {
                            "__ansible_unsafe": "24"
                        }
                    },
                    "ipv6": [
                        {
                            "address": {
                                "__ansible_unsafe": "fe80::d20d:edff:fe12:3ab1"
                            },
                            "prefix": {
                                "__ansible_unsafe": "64"
                            },
                            "scope": {
                                "__ansible_unsafe": "link"
                            }
                        }
                    ],
                    "macaddress": {
                        "__ansible_unsafe": "d0:0d:ed:12:3a:b1"
                    },
                    "module": {
                        "__ansible_unsafe": "virtio_net"
                    },
                    "mtu": 1500,
                    "pciid": {
                        "__ansible_unsafe": "virtio0"
                    },
                    "promisc": false,
                    "speed": -1,
                    "timestamping": [],
                    "type": {
                        "__ansible_unsafe": "ether"
                    }
                },
                "ansible_fibre_channel_wwn": [],
                "ansible_fips": false,
                "ansible_form_factor": {
                    "__ansible_unsafe": "Other"
                },
                "ansible_fqdn": {
                    "__ansible_unsafe": "test.ru-central1.internal"
                },
                "ansible_host": "51.250.89.217",
                "ansible_hostname": {
                    "__ansible_unsafe": "test"
                },
                "ansible_hostnqn": {
                    "__ansible_unsafe": ""
                },
                "ansible_interfaces": [
                    {
                        "__ansible_unsafe": "eth0"
                    },
                    {
                        "__ansible_unsafe": "lo"
                    }
                ],
                "ansible_is_chroot": false,
                "ansible_iscsi_iqn": {
                    "__ansible_unsafe": "iqn.2004-10.com.ubuntu:01:70bb35cbb955"
                },
                "ansible_kernel": {
                    "__ansible_unsafe": "5.15.0-47-generic"
                },
                "ansible_kernel_version": {
                    "__ansible_unsafe": "#51-Ubuntu SMP Thu Aug 11 07:51:15 UTC 2022"
                },
                "ansible_lo": {
                    "active": true,
                    "device": {
                        "__ansible_unsafe": "lo"
                    },
                    "features": {
                        "esp_hw_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "esp_tx_csum_hw_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "fcoe_mtu": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "generic_receive_offload": {
                            "__ansible_unsafe": "on"
                        },
                        "generic_segmentation_offload": {
                            "__ansible_unsafe": "on"
                        },
                        "highdma": {
                            "__ansible_unsafe": "on [fixed]"
                        },
                        "hsr_dup_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "hsr_fwd_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "hsr_tag_ins_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "hsr_tag_rm_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "hw_tc_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "l2_fwd_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "large_receive_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "loopback": {
                            "__ansible_unsafe": "on [fixed]"
                        },
                        "macsec_hw_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "netns_local": {
                            "__ansible_unsafe": "on [fixed]"
                        },
                        "ntuple_filters": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "receive_hashing": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "rx_all": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "rx_checksumming": {
                            "__ansible_unsafe": "on [fixed]"
                        },
                        "rx_fcs": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "rx_gro_hw": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "rx_gro_list": {
                            "__ansible_unsafe": "off"
                        },
                        "rx_udp_gro_forwarding": {
                            "__ansible_unsafe": "off"
                        },
                        "rx_udp_tunnel_port_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "rx_vlan_filter": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "rx_vlan_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "rx_vlan_stag_filter": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "rx_vlan_stag_hw_parse": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "scatter_gather": {
                            "__ansible_unsafe": "on"
                        },
                        "tcp_segmentation_offload": {
                            "__ansible_unsafe": "on"
                        },
                        "tls_hw_record": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tls_hw_rx_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tls_hw_tx_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_checksum_fcoe_crc": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_checksum_ip_generic": {
                            "__ansible_unsafe": "on [fixed]"
                        },
                        "tx_checksum_ipv4": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_checksum_ipv6": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_checksum_sctp": {
                            "__ansible_unsafe": "on [fixed]"
                        },
                        "tx_checksumming": {
                            "__ansible_unsafe": "on"
                        },
                        "tx_esp_segmentation": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_fcoe_segmentation": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_gre_csum_segmentation": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_gre_segmentation": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_gso_list": {
                            "__ansible_unsafe": "on"
                        },
                        "tx_gso_partial": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_gso_robust": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_ipxip4_segmentation": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_ipxip6_segmentation": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_lockless": {
                            "__ansible_unsafe": "on [fixed]"
                        },
                        "tx_nocache_copy": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_scatter_gather": {
                            "__ansible_unsafe": "on [fixed]"
                        },
                        "tx_scatter_gather_fraglist": {
                            "__ansible_unsafe": "on [fixed]"
                        },
                        "tx_sctp_segmentation": {
                            "__ansible_unsafe": "on"
                        },
                        "tx_tcp6_segmentation": {
                            "__ansible_unsafe": "on"
                        },
                        "tx_tcp_ecn_segmentation": {
                            "__ansible_unsafe": "on"
                        },
                        "tx_tcp_mangleid_segmentation": {
                            "__ansible_unsafe": "on"
                        },
                        "tx_tcp_segmentation": {
                            "__ansible_unsafe": "on"
                        },
                        "tx_tunnel_remcsum_segmentation": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_udp_segmentation": {
                            "__ansible_unsafe": "on"
                        },
                        "tx_udp_tnl_csum_segmentation": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_udp_tnl_segmentation": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_vlan_offload": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "tx_vlan_stag_hw_insert": {
                            "__ansible_unsafe": "off [fixed]"
                        },
                        "vlan_challenged": {
                            "__ansible_unsafe": "on [fixed]"
                        }
                    },
                    "hw_timestamp_filters": [],
                    "ipv4": {
                        "address": {
                            "__ansible_unsafe": "127.0.0.1"
                        },
                        "broadcast": {
                            "__ansible_unsafe": ""
                        },
                        "netmask": {
                            "__ansible_unsafe": "255.0.0.0"
                        },
                        "network": {
                            "__ansible_unsafe": "127.0.0.0"
                        },
                        "prefix": {
                            "__ansible_unsafe": "8"
                        }
                    },
                    "ipv6": [
                        {
                            "address": {
                                "__ansible_unsafe": "::1"
                            },
                            "prefix": {
                                "__ansible_unsafe": "128"
                            },
                            "scope": {
                                "__ansible_unsafe": "host"
                            }
                        }
                    ],
                    "mtu": 65536,
                    "promisc": false,
                    "timestamping": [],
                    "type": {
                        "__ansible_unsafe": "loopback"
                    }
                },
                "ansible_local": {},
                "ansible_lsb": {
                    "codename": {
                        "__ansible_unsafe": "jammy"
                    },
                    "description": {
                        "__ansible_unsafe": "Ubuntu 22.04.1 LTS"
                    },
                    "id": {
                        "__ansible_unsafe": "Ubuntu"
                    },
                    "major_release": {
                        "__ansible_unsafe": "22"
                    },
                    "release": {
                        "__ansible_unsafe": "22.04"
                    }
                },
                "ansible_lvm": {
                    "lvs": {},
                    "pvs": {},
                    "vgs": {}
                },
                "ansible_machine": {
                    "__ansible_unsafe": "x86_64"
                },
                "ansible_machine_id": {
                    "__ansible_unsafe": ""
                },
                "ansible_memfree_mb": 73,
                "ansible_memory_mb": {
                    "nocache": {
                        "free": 739,
                        "used": 229
                    },
                    "real": {
                        "free": 73,
                        "total": 968,
                        "used": 895
                    },
                    "swap": {
                        "cached": 0,
                        "free": 0,
                        "total": 0,
                        "used": 0
                    }
                },
                "ansible_memtotal_mb": 968,
                "ansible_mounts": [
                    {
                        "block_available": 2571685,
                        "block_size": 4096,
                        "block_total": 3847169,
                        "block_used": 1275484,
                        "device": {
                            "__ansible_unsafe": "/dev/vda2"
                        },
                        "fstype": {
                            "__ansible_unsafe": "ext4"
                        },
                        "inode_available": 865900,
                        "inode_total": 983040,
                        "inode_used": 117140,
                        "mount": {
                            "__ansible_unsafe": "/"
                        },
                        "options": {
                            "__ansible_unsafe": "rw,relatime"
                        },
                        "size_available": 10533621760,
                        "size_total": 15758004224,
                        "uuid": {
                            "__ansible_unsafe": "9c32f6b6-779b-4319-b576-165bf47e9034"
                        }
                    },
                    {
                        "block_available": 0,
                        "block_size": 131072,
                        "block_total": 496,
                        "block_used": 496,
                        "device": {
                            "__ansible_unsafe": "/dev/loop0"
                        },
                        "fstype": {
                            "__ansible_unsafe": "squashfs"
                        },
                        "inode_available": 0,
                        "inode_total": 11778,
                        "inode_used": 11778,
                        "mount": {
                            "__ansible_unsafe": "/snap/core20/1405"
                        },
                        "options": {
                            "__ansible_unsafe": "ro,nodev,relatime,errors=continue"
                        },
                        "size_available": 0,
                        "size_total": 65011712,
                        "uuid": {
                            "__ansible_unsafe": "N/A"
                        }
                    },
                    {
                        "block_available": 0,
                        "block_size": 131072,
                        "block_total": 506,
                        "block_used": 506,
                        "device": {
                            "__ansible_unsafe": "/dev/loop1"
                        },
                        "fstype": {
                            "__ansible_unsafe": "squashfs"
                        },
                        "inode_available": 0,
                        "inode_total": 11882,
                        "inode_used": 11882,
                        "mount": {
                            "__ansible_unsafe": "/snap/core20/1623"
                        },
                        "options": {
                            "__ansible_unsafe": "ro,nodev,relatime,errors=continue"
                        },
                        "size_available": 0,
                        "size_total": 66322432,
                        "uuid": {
                            "__ansible_unsafe": "N/A"
                        }
                    },
                    {
                        "block_available": 0,
                        "block_size": 131072,
                        "block_total": 640,
                        "block_used": 640,
                        "device": {
                            "__ansible_unsafe": "/dev/loop2"
                        },
                        "fstype": {
                            "__ansible_unsafe": "squashfs"
                        },
                        "inode_available": 0,
                        "inode_total": 816,
                        "inode_used": 816,
                        "mount": {
                            "__ansible_unsafe": "/snap/lxd/22923"
                        },
                        "options": {
                            "__ansible_unsafe": "ro,nodev,relatime,errors=continue"
                        },
                        "size_available": 0,
                        "size_total": 83886080,
                        "uuid": {
                            "__ansible_unsafe": "N/A"
                        }
                    },
                    {
                        "block_available": 0,
                        "block_size": 131072,
                        "block_total": 824,
                        "block_used": 824,
                        "device": {
                            "__ansible_unsafe": "/dev/loop3"
                        },
                        "fstype": {
                            "__ansible_unsafe": "squashfs"
                        },
                        "inode_available": 0,
                        "inode_total": 816,
                        "inode_used": 816,
                        "mount": {
                            "__ansible_unsafe": "/snap/lxd/23541"
                        },
                        "options": {
                            "__ansible_unsafe": "ro,nodev,relatime,errors=continue"
                        },
                        "size_available": 0,
                        "size_total": 108003328,
                        "uuid": {
                            "__ansible_unsafe": "N/A"
                        }
                    },
                    {
                        "block_available": 0,
                        "block_size": 131072,
                        "block_total": 384,
                        "block_used": 384,
                        "device": {
                            "__ansible_unsafe": "/dev/loop5"
                        },
                        "fstype": {
                            "__ansible_unsafe": "squashfs"
                        },
                        "inode_available": 0,
                        "inode_total": 486,
                        "inode_used": 486,
                        "mount": {
                            "__ansible_unsafe": "/snap/snapd/16778"
                        },
                        "options": {
                            "__ansible_unsafe": "ro,nodev,relatime,errors=continue"
                        },
                        "size_available": 0,
                        "size_total": 50331648,
                        "uuid": {
                            "__ansible_unsafe": "N/A"
                        }
                    },
                    {
                        "block_available": 0,
                        "block_size": 131072,
                        "block_total": 384,
                        "block_used": 384,
                        "device": {
                            "__ansible_unsafe": "/dev/loop6"
                        },
                        "fstype": {
                            "__ansible_unsafe": "squashfs"
                        },
                        "inode_available": 0,
                        "inode_total": 486,
                        "inode_used": 486,
                        "mount": {
                            "__ansible_unsafe": "/snap/snapd/17029"
                        },
                        "options": {
                            "__ansible_unsafe": "ro,nodev,relatime,errors=continue"
                        },
                        "size_available": 0,
                        "size_total": 50331648,
                        "uuid": {
                            "__ansible_unsafe": "N/A"
                        }
                    }
                ],
                "ansible_nodename": {
                    "__ansible_unsafe": "test"
                },
                "ansible_os_family": {
                    "__ansible_unsafe": "Debian"
                },
                "ansible_pkg_mgr": {
                    "__ansible_unsafe": "apt"
                },
                "ansible_proc_cmdline": {
                    "BOOT_IMAGE": {
                        "__ansible_unsafe": "/boot/vmlinuz-5.15.0-47-generic"
                    },
                    "biosdevname": {
                        "__ansible_unsafe": "0"
                    },
                    "console": {
                        "__ansible_unsafe": "ttyS0"
                    },
                    "net.ifnames": {
                        "__ansible_unsafe": "0"
                    },
                    "ro": true,
                    "root": {
                        "__ansible_unsafe": ""
                    }
                },
                "ansible_processor": [
                    {
                        "__ansible_unsafe": "0"
                    },
                    {
                        "__ansible_unsafe": "GenuineIntel"
                    },
                    {
                        "__ansible_unsafe": "Intel Xeon Processor (Icelake)"
                    },
                    {
                        "__ansible_unsafe": "1"
                    },
                    {
                        "__ansible_unsafe": "GenuineIntel"
                    },
                    {
                        "__ansible_unsafe": "Intel Xeon Processor (Icelake)"
                    }
                ],
                "ansible_processor_cores": 1,
                "ansible_processor_count": 1,
                "ansible_processor_nproc": 2,
                "ansible_processor_threads_per_core": 2,
                "ansible_processor_vcpus": 2,
                "ansible_product_name": {
                    "__ansible_unsafe": ""
                },
                "ansible_product_serial": {
                    "__ansible_unsafe": ""
                },
                "ansible_product_uuid": {
                    "__ansible_unsafe": ""
                },
                "ansible_product_version": {
                    "__ansible_unsafe": "pc-q35-yc-2.12"
                },
                "ansible_python": {
                    "executable": {
                        "__ansible_unsafe": "/usr/bin/python3"
                    },
                    "has_sslcontext": true,
                    "type": {
                        "__ansible_unsafe": "cpython"
                    },
                    "version": {
                        "major": 3,
                        "micro": 4,
                        "minor": 10,
                        "releaselevel": {
                            "__ansible_unsafe": "final"
                        },
                        "serial": 0
                    },
                    "version_info": [
                        3,
                        10,
                        4,
                        {
                            "__ansible_unsafe": "final"
                        },
                        0
                    ]
                },
                "ansible_python_version": {
                    "__ansible_unsafe": "3.10.4"
                },
                "ansible_real_group_id": 0,
                "ansible_real_user_id": 0,
                "ansible_selinux": {
                    "status": {
                        "__ansible_unsafe": "disabled"
                    }
                },
                "ansible_selinux_python_present": true,
                "ansible_service_mgr": {
                    "__ansible_unsafe": "systemd"
                },
                "ansible_ssh_host_key_dsa_public": {
                    "__ansible_unsafe": ""},
                "ansible_ssh_host_key_dsa_public_keytype": {
                    "__ansible_unsafe": "ssh-dss"
                },
                "ansible_ssh_host_key_ecdsa_public": {
                    "__ansible_unsafe": ""},
                "ansible_ssh_host_key_ecdsa_public_keytype": {
                    "__ansible_unsafe": "ecdsa-sha2-nistp256"
                },
                "ansible_ssh_host_key_ed25519_public": {
                    "__ansible_unsafe": ""
                },
                "ansible_ssh_host_key_ed25519_public_keytype": {
                    "__ansible_unsafe": "ssh-ed25519"
                },
                "ansible_ssh_host_key_rsa_public": {
                    "__ansible_unsafe": ""},
                "ansible_ssh_host_key_rsa_public_keytype": {
                    "__ansible_unsafe": "ssh-rsa"
                },
                "ansible_swapfree_mb": 0,
                "ansible_swaptotal_mb": 0,
                "ansible_system": {
                    "__ansible_unsafe": "Linux"
                },
                "ansible_system_capabilities": [],
                "ansible_system_capabilities_enforced": {
                    "__ansible_unsafe": "False"
                },
                "ansible_system_vendor": {
                    "__ansible_unsafe": "Yandex"
                },
                "ansible_uptime_seconds": 438,
                "ansible_user": "test",
                "ansible_user_dir": {
                    "__ansible_unsafe": "/root"
                },
                "ansible_user_gecos": {
                    "__ansible_unsafe": "root"
                },
                "ansible_user_gid": 0,
                "ansible_user_id": {
                    "__ansible_unsafe": "root"
                },
                "ansible_user_shell": {
                    "__ansible_unsafe": "/bin/bash"
                },
                "ansible_user_uid": 0,
                "ansible_userspace_architecture": {
                    "__ansible_unsafe": "x86_64"
                },
                "ansible_userspace_bits": {
                    "__ansible_unsafe": "64"
                },
                "ansible_virtualization_role": {
                    "__ansible_unsafe": "NA"
                },
                "ansible_virtualization_tech_guest": [],
                "ansible_virtualization_tech_host": [],
                "ansible_virtualization_type": {
                    "__ansible_unsafe": "NA"
                },
                "discovered_interpreter_python": {
                    "__ansible_unsafe": "/usr/bin/python3"
                },
                "gather_subset": [
                    {
                        "__ansible_unsafe": "all"
                    }
                ],
                "module_setup": true
            }
        }
    },
    "all": {
        "children": [
            "baka",
            "ungrouped"
        ]
    },
    "baka": {
        "hosts": [
            "bakavm"
        ]
    }
}

```
