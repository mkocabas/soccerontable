#!/usr/bin/env bash
export DATADIR=/home/mkocabas/developments/soccerontable/data/galatasaray
export DETECTRON=/home/mkocabas/developments/detectron
export SOCCERCODE=/home/mkocabas/developments/soccerontable
export OPENPOSEDIR=/home/mkocabas/developments/openpose
export OMP_NUM_THREADS=8
export MODELPATH=/home/mkocabas/developments/soccerontable/model.pth

cd $DETECTRON

python tools/infer_subimages.py --cfg configs/12_2017_baselines/e2e_mask_rcnn_R-101-FPN_2x.yaml \
                                --output-dir $DATADIR/detectron \
                                --image-ext jpg \
                                --wts https://dl.fbaipublicfiles.com/detectron/35861858/12_2017_baselines/e2e_mask_rcnn_R-101-FPN_2x.yaml.02_32_51.SgT4y1cO/output/train/coco_2014_train:coco_2014_valminusminival/generalized_rcnn/model_final.pkl \
                                $DATADIR/images/

cd $SOCCERCODE
python demo/calibrate_video.py --path_to_data $DATADIR

python demo/estimate_poses.py --path_to_data $DATADIR --openpose_dir $OPENPOSEDIR

python demo/crop_players.py --path_to_data $DATADIR
./soccer3d/instancesegm/instancesegm --path_to_data $DATADIR/players/ --thresh 1.5 --path_to_model ./soccer3d/instancesegm/model.yml.gz

python demo/combine_masks_for_network.py --path_to_data $DATADIR
python soccer3d/soccerdepth/test.py --path_to_data $DATADIR/players --modelpath $MODELPATH

python demo/depth_estimation_to_pointcloud.py --path_to_data $DATADIR

python demo/track_players.py --path_to_data $DATADIR
python demo/generate_mesh.py --path_to_data $DATADIR

python demo/make_field_texture.py --path_to_data $DATADIR

python demo/simple_visualization.py --path_to_data $DATADIR