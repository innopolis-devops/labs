# Output of Terraform show 
docker_container.nginx: 
resource “docker_container” “nginx” { attach = false command = [ “nginx”, “-g”, “daemon off;”, ] container_read_refresh_timeout_milliseconds =
15000 cpu_shares = 0 entrypoint = [ “/docker-entrypoint.sh”, ] env = [] hostname = “21dca2656095” id =
“21dca2656095460e1391309cc5904b687acdaee6500a047df9493911addb239c” image =
“sha256:f9c14fe76d502861ba0939bc3189e642c02e257f06f4c0214b1f8ca329326cda” init = false ipc_mode = “private” log_driver = “json-file” logs =
false max_retry_count = 0 memory = 0 memory_swap = 0 must_run = true name = “tutorial” network_data = [ { gateway = “172.17.0.1”
global_ipv6_address = “” global_ipv6_prefix_length = 0 ip_address = “172.17.0.2” ip_prefix_length = 16 ipv6_gateway = “” mac_address = “02:42:ac
11:00:02” network_name = “bridge” }, ] network_mode = “default” privileged = false publish_all_ports = false read_only = false remove_volumes =
true restart = “no” rm = false runtime = “runc” security_opts = [] shm_size = 64 start = true stdin_open = false stop_signal = “SIGQUIT” stop_timeout
= 0 tty = false wait = false wait_timeout = 60 
ports {
external = 8000
internal = 80
ip = "0.0.0.0"
protocol = "tcp"
}

} 
docker_image.nginx: 
resource “docker_image” “nginx” { id = “sha256:f9c14fe76d502861ba0939bc3189e642c02e257f06f4c0214b1f8ca329326cdanginx:latest” image_id =
“sha256:f9c14fe76d502861ba0939bc3189e642c02e257f06f4c0214b1f8ca329326cda” keep_locally = false name = “nginx:latest” repo_digest =
“nginx@sha256:af296b188c7b7df99ba960ca614439c99cb7cf252ed7bbc23e90cfda59092305” } 

# Output of terraform state list 
docker_container.nginx docker_image.nginx 
aws_instance.app_server: 
resource “aws_instance” “app_server” { ami = “ami-08d70e59c07c61a3a” arn = “arn:aws:ec2:us-west-2:354156216263:instance
i-0b39be7dc8d0a893a” associate_public_ip_address = true availability_zone = “us-west-2a” cpu_core_count = 1 cpu_threads_per_core = 1
disable_api_stop = false disable_api_termination = false ebs_optimized = false get_password_data = false hibernation = false id =
“i-0b39be7dc8d0a893a” instance_initiated_shutdown_behavior = “stop” instance_state = “running” instance_type = “t2.micro” ipv6_address_count =
0 ipv6_addresses = [] monitoring = false placement_partition_number = 0 primary_network_interface_id = “eni-0cc62b162b9c9df4c” private_dns =
“ip-172-31-16-27.us-west-2.compute.internal” private_ip = “172.31.16.27” public_dns = “ec2-35-93-162-232.us-west-2.compute.amazonaws.com”
public_ip = “35.93.162.232” secondary_private_ips = [] security_groups = [ “default”, ] source_dest_check = true subnet_id =
“subnet-039b0778d5eaf2eb4” tags = { “Name” = “ExampleAppServerInstance” } tags_all = { “Name” = “ExampleAppServerInstance” } tenancy =
“default” user_data_replace_on_change = false vpc_security_group_ids = [ “sg-0849ce7988dae5104”, ] 
capacity_reservation_specification {
capacity_reservation_preference = "open"
}
cpu_options {
core_count = 1
threads_per_core = 1
}
credit_specification {
cpu_credits = "standard"
}
enclave_options {
enabled = false
}
maintenance_options {
auto_recovery = "default"
}metadata_options {
http_endpoint = "enabled"
http_put_response_hop_limit = 1
http_tokens = "optional"
instance_metadata_tags = "disabled"
}
private_dns_name_options {
enable_resource_name_dns_a_record = false
enable_resource_name_dns_aaaa_record = false
hostname_type = "ip-name"
}
root_block_device {
delete_on_termination = true
device_name = "/dev/sda1"
encrypted = false
iops = 100
tags = {}
throughput = 0
volume_id = "vol-0403cb7cdf11b3fb7"
volume_size = 8
volume_type = "gp2"
}
