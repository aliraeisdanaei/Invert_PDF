This is a simple bash script to invert the colour of pdfs.

It can take directories and single files as input.

The first argument must always be the input path.

The second argument is optional, and may be the output path for a single file. If no output path is given the input path is used as the output path with an add postfix before the file extension.

Here are simple ways to use it.

# make the file executable
chomd +x invert_pdf.sh

# invert one file
./invert_pdf.sh input_file.pdf output_file.pdf

# invert a whole directory
./invert_pdf.sh path_to_directory

God bless
