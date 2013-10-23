# Right now you also need to set values in saltstack/pillar/master/auth.sls
# until in the future we can find a way to read the YAML data from there
# and import it here

# Rackspace Settings
$rs_username    = "UserName"
$rs_api_key     = "..."
$rs_flavor      = /512MB/
$rs_image       = /Ubuntu 12\.04/

# Digital Ocean
$do_client_id   = '...'
$do_api_key     = '...'

# AWS Settings
=begin
$aws_access_key_id = "..."
$aws_secret_access_key = "..."
$aws_keypair_name = "..."
$aws_ssh_private_key_path = "/path/to/.ssh/id_rsa"

$aws_ami = "ami-4ac9437a"
$aws_ssh_username = "ubuntu"
$aws_region = "us-west-2"
$aws_instance_name = "m1.small"
# used in demo: cc2.8xlarge
=end