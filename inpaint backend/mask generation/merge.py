import cv2
import numpy as np

for i in range(0, 99):
    # Load the input image
    input_img = cv2.imread("./test/31.jpg")

    # Load the mask image
    mask_img = cv2.imread(f"./test/maskn0_{i}.jpg", cv2.IMREAD_GRAYSCALE)

    # Set a threshold value
    threshold = 128

    # Create a binary mask where pixels with value greater than or equal to the threshold in the mask image are set to 1
    binary_mask = np.where(mask_img >= threshold, 1, 0)

    # Set the pixels in the input image corresponding to the binary mask to black (0, 0, 0)
    input_img[binary_mask == 1] = (0, 0, 0)

    # Save the resulting image
    cv2.imwrite(f"./test/result/result{i}.jpg", input_img)