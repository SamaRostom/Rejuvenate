import base64
import json
import os
from flask import Flask, jsonify, request, send_file, send_from_directory, url_for
from PIL import Image
from io import BytesIO
import torch
from diffusers import StableDiffusionInpaintPipeline
from transformers import logging as hf_logging
import werkzeug

print("Is torch available?  ",torch.cuda.is_available())

hf_logging.set_verbosity(hf_logging.WARNING)
app = Flask(__name__)

device = "cuda"
model_path = "runwayml/stable-diffusion-inpainting"

try:
    pipe = StableDiffusionInpaintPipeline.from_pretrained(
        model_path,
        torch_dtype=torch.float16,
    ).to(device)
except Exception as e:
    print(f"An error occurred while loading the pre-trained model: {e}")


@app.route('/inpaint', methods=['POST'])
def inpaint():
    if (request.method == 'POST'):
        input_img = request.files['input']
        mask_img = request.files['mask']
        filename1 = werkzeug.utils.secure_filename(input_img.filename)
        filename2 = werkzeug.utils.secure_filename(mask_img.filename)
        input_img.save(filename1)
        mask_img.save(filename2)
        input_img = Image.open(filename1).convert('RGB').resize((512, 512))
        mask_img = Image.open(filename2).convert('RGB').resize((512, 512))

        # Run the inpainting pipeline
        output_img = pipe(prompt="", image=input_img, mask_image=mask_img).images
        output = output_img[0]

        # # Encode the output image in base64 format
        output_buffer = BytesIO()
        output.save(output_buffer, format='JPEG')
        output_base64 = base64.b64encode(output_buffer.getvalue()).decode('utf-8')

        # Return the output image as a JSON response
        return jsonify({'output_image': output_base64})

@app.route('/')
def user():
    return "Done"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000, debug=True)