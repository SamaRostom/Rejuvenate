import os

# Set the directory path
dir_path = 'D:/Graduation project/Mask generation/Steamsamayurkey/newtrail/mask/maskedimages'
new_dir_path = os.path.join(dir_path, 'new')

# Create the new directory if it doesn't exist
if not os.path.exists(new_dir_path):
    os.makedirs(new_dir_path)

# Set the starting number for the new filenames
start_num = 1

# Iterate over the files in the directory
for filename in os.listdir(dir_path):
    # Check if the file is an image
    if filename.endswith('.jpg') or filename.endswith('.png'):
        # Construct the new filename
        new_filename = f'{start_num}.jpg'
        # Rename and move the file to the new directory
        os.rename(os.path.join(dir_path, filename), os.path.join(new_dir_path, new_filename))
        # Increment the starting number
        start_num += 1