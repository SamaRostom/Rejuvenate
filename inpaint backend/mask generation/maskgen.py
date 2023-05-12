import json
import numpy as np
import os
import cv2
from detectron2.data import MetadataCatalog, DatasetCatalog
from detectron2.structures import BoxMode
from detectron2.engine import DefaultTrainer, DefaultPredictor
from detectron2.config import get_cfg
from detectron2 import model_zoo
from detectron2.utils.visualizer import Visualizer
from detectron2.data import DatasetMapper
from detectron2.data import build_detection_train_loader
from detectron2.data import detection_utils as utils
from detectron2.evaluation import COCOEvaluator, inference_on_dataset
from detectron2.checkpoint import DetectionCheckpointer
import dataModel
# register the dataset
def get_dataset_dicts(json_file):
    with open(json_file) as f:
        imgs_anns = json.load(f)
        imgs_anns2 = dataModel.data_from_dict(imgs_anns)
        jpgs=imgs_anns2.jpg
    dataset_dicts = []
    print(imgs_anns.values)
    for idx, v in enumerate(jpgs):
        record = {}
        filename = os.path.join("D:/Graduation project/Mask generation/Steamsamayurkey/newtrail/mask/clefttest_", v.filename)
        height, width = cv2.imread(filename).shape[:2]
        record["file_name"] = filename
        record["image_id"] = idx
        record["height"] = height
        record["width"] = width

        annos = v.regions
        objs = []
        
        anno = annos.the_0
        if anno.region_attributes.label == "Cleftlip":
            # extract the polygon coordinates of the cleft lip area
            polygons = [anno.shape_attributes.all_points_x, anno.shape_attributes.all_points_y]
            polygons = np.array(polygons).reshape((-1, 2))
            obj = {
                "bbox": [np.min(polygons[:, 0]), np.min(polygons[:, 1]), np.max(polygons[:, 0]), np.max(polygons[:, 1])],
                "bbox_mode": BoxMode.XYXY_ABS,
                "segmentation": [polygons.flatten().tolist()],
                "category_id": 0,
            }
        objs.append(obj)
        record["annotations"] = objs
        dataset_dicts.append(record)
    return dataset_dicts

if __name__ == '__main__':

    DatasetCatalog.register("my_dataset", lambda: get_dataset_dicts("D:/Graduation project/Mask generation/Steamsamayurkey/newtrail/mask/jsonfilenew.json"))
    MetadataCatalog.get("my_dataset").set(thing_classes=["Cleftlip"])
    metadata = MetadataCatalog.get("my_dataset")

    # train the Mask R-CNN model
    cfg = get_cfg()
    cfg.merge_from_file(model_zoo.get_config_file("COCO-InstanceSegmentation/mask_rcnn_R_50_FPN_3x.yaml"))
    cfg.DATASETS.TRAIN = ("my_dataset",)
    #8
    cfg.DATALOADER.NUM_WORKERS = 8
    cfg.MODEL.WEIGHTS = model_zoo.get_checkpoint_url("COCO-InstanceSegmentation/mask_rcnn_R_50_FPN_3x.yaml")
    cfg.SOLVER.IMS_PER_BATCH = 2
    cfg.SOLVER.BASE_LR = 0.0025
    #2000
    cfg.SOLVER.MAX_ITER = 2000 
    #64
    cfg.MODEL.ROI_HEADS.BATCH_SIZE_PER_IMAGE = 64
    cfg.MODEL.ROI_HEADS.NUM_CLASSES = 1
    cfg.DATASETS.TEST = ()

    os.makedirs(cfg.OUTPUT_DIR, exist_ok=True)
    trainer = DefaultTrainer(cfg)
    trainer.resume_or_load(resume=True)
    trainer.train()

    # use the trained model to generate masks
    cfg.MODEL.WEIGHTS = os.path.join(cfg.OUTPUT_DIR, "model_final.pth")



    # Load the configuration of the Mask R-CNN model
    cfg.MODEL.ROI_HEADS.SCORE_THRESH_TEST = 0  # set a threshold for post-processing

    # Create the predictor for the Mask R-CNN model
    predictor = DefaultPredictor(cfg)

    # Load an image
    img = cv2.imread("D:/Graduation project/Mask generation/Steamsamayurkey/newtrail/mask/test/31.jpg")
    
    # Use the predictor to generate masks for the image
    outputs = predictor(img)
    print(outputs)
    # Extract the predicted instances and their corresponding masks
    instances = outputs["instances"]
    masks = instances.pred_masks.cpu().numpy()

    # Visualize the predicted masks on the image
    v = Visualizer(img[:, :, ::-1], metadata=metadata, scale=1.2)
    v = v.draw_instance_predictions(instances.to("cpu"))
    vis_img = v.get_image()[:, :, ::-1]
    # Save the generated masks
    for i, mask in enumerate(masks):
        mask_img = np.zeros_like(img)
        mask_img[:, :, 0] = mask * 255
        mask_img[:, :, 1] = mask * 255
        mask_img[:, :, 2] = mask * 255
        cv2.imwrite(f"maskn0_{i}.jpg", mask_img)

