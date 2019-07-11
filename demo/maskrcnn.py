import sys
sys.path.insert(0,'/home/mkocabas/developments/maskrcnn-benchmark')

from maskrcnn_benchmark.config import cfg
from demo.predictor import COCODemo
import sys
import os
import cv2
import pickle as pkl

indir = sys.argv[1]
outdir = sys.argv[2]

config_file = "/home/mkocabas/developments/maskrcnn-benchmark/configs/caffe2/e2e_mask_rcnn_R_50_FPN_1x_caffe2.yaml"

# update the config options with the config file
cfg.merge_from_file(config_file)
# manual override some options
cfg.merge_from_list(["MODEL.DEVICE", "cuda"])

coco_demo = COCODemo(
    cfg,
    min_image_size=800,
    confidence_threshold=0.7,
)
# load image and then run prediction

images = [os.path.join(indir, x) for x in os.listdir(indir) if x.endswith('.png') or x.endswith('.jpg')]

preds = []
for idx, img in enumerate(images[:5]):
    print(f'******* Processing {idx+1}/{len(images)} - {img} *******')
    image = cv2.imread(img)
    overlay, predictions = coco_demo.run_on_opencv_image(image)
    preds.append(predictions)

print(preds)

os.makedirs(outdir, exist_ok=True)

with open(os.path.join(outdir, 'maskrcnn_predictions.pkl'), 'wb') as f:
    pkl.dump(preds, f)

breakpoint()