#!/usr/bin/env bash

cd /home/mkocabas/developments/detectron

#python tools/infer_simple.py \
#    --cfg configs/12_2017_baselines/e2e_mask_rcnn_R-101-FPN_2x.yaml \
#    --output-dir /home/mkocabas/developments/soccerontable/barcelona/detectron/ \
#    --image-ext jpg \
#    --wts https://dl.fbaipublicfiles.com/detectron/35861858/12_2017_baselines/e2e_mask_rcnn_R-101-FPN_2x.yaml.02_32_51.SgT4y1cO/output/train/coco_2014_train:coco_2014_valminusminival/generalized_rcnn/model_final.pkl \
#    /home/mkocabas/developments/soccerontable/barcelona/images/

python tools/infer_subimages.py --cfg configs/12_2017_baselines/e2e_mask_rcnn_R-101-FPN_2x.yaml \
                                --output-dir /home/mkocabas/developments/soccerontable/barcelona/detectron/ \
                                --image-ext jpg \
                                --wts https://dl.fbaipublicfiles.com/detectron/35861858/12_2017_baselines/e2e_mask_rcnn_R-101-FPN_2x.yaml.02_32_51.SgT4y1cO/output/train/coco_2014_train:coco_2014_valminusminival/generalized_rcnn/model_final.pkl \
                                /home/mkocabas/developments/soccerontable/barcelona/images/

#python tools/infer_subimages.py --cfg configs/12_2017_baselines/e2e_mask_rcnn_R-101-FPN_1x.yaml \
#                                --output-dir /home/mkocabas/developments/soccerontable/barcelona/detectron/ \
#                                --image-ext jpg \
#                                --wts https://dl.fbaipublicfiles.com/detectron/36229407/12_2017_baselines/mask_rcnn_R-101-FPN_1x.yaml.09_38_04.zbVPo8ZE/output/train/coco_2014_train%3Acoco_2014_valminusminival/generalized_rcnn/model_final.pkl \
#                                /home/mkocabas/developments/soccerontable/barcelona/images/

#python tools/infer_subimages.py --cfg configs/12_2017_baselines/e2e_mask_rcnn_R-50-FPN_1x.yaml \
#                                --output-dir /home/mkocabas/developments/soccerontable/barcelona/detectron/ \
#                                --image-ext jpg \
#                                --wts https://dl.fbaipublicfiles.com/detectron/36225401/12_2017_baselines/mask_rcnn_R-50-FPN_1x.yaml.08_42_04.MocEgrRW/output/train/coco_2014_train%3Acoco_2014_valminusminival/generalized_rcnn/model_final.pkl \
#                                /home/mkocabas/developments/soccerontable/barcelona/images/

