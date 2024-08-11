import ipaddress

# Define the path to the input file and output file
input_file_path = r'D:\sophos import host\c.txt'
output_file_path = r'D:\sophos import host\d.txt'

# Define the template with placeholders for the IP address, name, and subnet
template = '''<IPHost transactionid="">
    <Name>{}</Name>
    <IPFamily>IPv4</IPFamily>
    <HostType>Network</HostType>
    <IPAddress>{}</IPAddress>
    <Subnet>{}</Subnet>
  </IPHost>'''

def read_ips(file_path):
    """Reads IP addresses from a file."""
    with open(file_path, 'r') as file:
        lines = file.readlines()
    # Strip any extra whitespace characters
    lines = [line.strip() for line in lines if line.strip()]
    return lines

def cidr_to_subnet(cidr):
    """Converts CIDR notation to subnet mask."""
    return str(ipaddress.IPv4Network(cidr, strict=False).netmask)

def generate_xml(lines, template, output_file_path):
    """Generates an XML string from IP addresses and a template."""
    with open(output_file_path, 'w') as output_file:
        for index, line in enumerate(lines):
            try:
                ip, cidr = line.split('/')
                name = f'GGL{index + 1}'
                subnet = cidr_to_subnet(line)
                output_file.write(template.format(name, ip, subnet) + '\n')
            except ValueError:
                print(f"Skipping invalid line: {line}")

# Read the IPs from the input file
lines = read_ips(input_file_path)

# Generate the XML and write it to the output file
generate_xml(lines, template, output_file_path)

print(f'XML file generated and saved to {output_file_path}')
