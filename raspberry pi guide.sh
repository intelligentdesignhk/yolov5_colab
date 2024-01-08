# install
cd ~/Desktop
wget https://ultralytics.com/assets/coco2017val.zip
unzip -q coco2017val.zip -d datasets && rm coco2017val.zip
git clone https://github.com/intelligentdesignhk/yolov5_colab.git  # clone
# run
cd ~/Desktop/yolov5_colab
python -m venv venv # create virtual env
source venv/bin/activate
pip install -qr requirements.txt comet_ml  # install python lib
# train model
# *trained model will save in ~/Desktop/yolov5_colab/runs/train
# *very slow on raspberry pi
python train.py --img 320 --batch 2 --epochs 3 --data coco_idt128.yaml --weights yolov5n.pt --cache 
# run 
# *Connect camera to raspberry pi
# *weights = path of model
python detect.py --weights runs/train/exp/weights/best.pt --img 320 --conf 0.25 --source 0
