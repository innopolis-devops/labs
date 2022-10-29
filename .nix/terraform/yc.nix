{ pkgs, system, terrafix }:
with (terrafix.hcl.${system} { inherit pkgs; });
let
  inherit (builtins) toString;
  variables = mkVariables {
    new-vm-name = { type = string; default = "terraform"; };
  };
  tfvars = mkVariableValues variables { };
  main = with _lib;
    mkBlocks_ tfvars.__
      {
        terraform = b {
          required_providers = b {
            yandex = a {
              source = "yandex-cloud/yandex";
            };
          };
          required_version = ">= 0.13";
        };
      }
      (__: with __; {
        provider.yandex = b {
          zone = "ru-central1-a";
          service_account_key_file = "key.json";
        };
      })
      (__: with __; {
        resource.yandex_vpc_network.network-1 = b {
          name = "network1";
        };
      })
      (__: with __; {
        resource.yandex_vpc_subnet.subnet-1 = b {
          name = "subnet1";
          zone = "ru-central1-a";
          network_id = yandex_vpc_network.network-1 "id";
          v4_cidr_blocks = [ "192.168.10.0/24" ];
        };
      })
      (__: with __; mapMerge
        [{ cores = 2; memory = 2; vm = "1"; }
          { cores = 4; memory = 4; vm = "2"; }]
        (x:
          {
            resource.yandex_compute_instance."vm-${x.vm}" = b {
              name = "${bb var.new-vm-name}-${x.vm}";
              resources = b {
                cores = x.cores;
                memory = x.memory;
              };
              folder_id = "b1gts78appf1ipshtfmb";
              boot_disk = b {
                initialize_params = b {
                  image_id = "fd8ingbofbh3j5h7i8ll";
                };
              };
              network_interface = b {
                subnet_id = yandex_vpc_subnet.subnet-1 "id";
                nat = true;
              };
              metadata = a {
                user-data = file [ "./meta" ];
              };
            };
          }
        )
      )
      (__: with __; modifyMapMerge [ 1 2 ] toString
        (x:
          {
            output."internal_ip_address_vm_${x}" = b {
              value = yandex_compute_instance."vm-${x}".network_interface "0" "ip_address";
            };
            output."external_ip_address_vm_${x}" = b {
              value = yandex_compute_instance."vm-${x}".network_interface "0" "nat_ip_address";
            };
          }
        )
      )
  ;
in
{
  inherit main variables tfvars;
}
