# Define the paths for the input and output files
input_file_path = "/path/to/goodw.txt"
output_file_path = "/path/to/hash_db_inject.txt"

# Open the input file for reading and the output file for writing
with open(input_file_path, 'r') as infile, open(output_file_path, 'w') as outfile:
    for line in infile:
        # Remove any newline characters
        line = line.strip()

        # Split the line by commas
        md5, sha256, file_name = line.split(',')

        # Format the line into the desired SQL format
        formatted_line = f"INSERT INTO goodware (md5, sha256, file_name) VALUES('{md5}','{sha256}','{file_name}');\n"

        # Write the formatted line to the output file
        outfile.write(formatted_line)

print("Conversion complete!")
