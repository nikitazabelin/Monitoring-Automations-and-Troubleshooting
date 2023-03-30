#This script uses the AWS CLI command to get a list of all security group IDs, 
#and then checks each security group for the specified IP address. If the IP address is allowed by the security group, 
#the script prints a message indicating which security group and CIDR allow the IP address.
#
import subprocess

ip_address = "10.0.0.1"  # Replace with the IP address you want to check

# Get a list of all security group IDs
output = subprocess.run(["aws", "ec2", "describe-security-groups", "--query", "SecurityGroups[].GroupId", "--output", "text"], capture_output=True, text=True)
group_ids = output.stdout.strip().split("\t")

# Check each security group for the IP address
for group_id in group_ids:
    output = subprocess.run(["aws", "ec2", "describe-security-groups", "--group-ids", group_id, "--query", "SecurityGroups[].IpPermissions[].IpRanges[].CidrIp", "--output", "text"], capture_output=True, text=True)
    cidrs = output.stdout.strip().split("\n")
    for cidr in cidrs:
        if ip_address in cidr:
            print(f"The IP address {ip_address} is allowed by security group {group_id} with CIDR {cidr}.")
