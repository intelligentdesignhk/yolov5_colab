# install
Download coco dataset and clone yolo from github repository
```
$ cd ~/Desktop
$ wget https://ultralytics.com/assets/coco2017val.zip
$ unzip -q coco2017val.zip -d datasets && rm coco2017val.zip
$ git clone https://github.com/intelligentdesignhk/yolov5_colab.git  # clone
```
# Object Detection
## train model
Setup env and install lib 
```
cd ~/Desktop/yolov5_colab
python -m venv venv # create virtual env
source venv/bin/activate # use virtual env
pip install -qr requirements.txt comet_ml  # install python lib
```
Trained model will save in ~/Desktop/yolov5_colab/runs/train<br>
Very slow on raspberry pi
```
python train.py --img 320 --batch 2 --epochs 3 --data coco_idt128.yaml --weights yolov5n.pt --cache 
```
# run 
Connect camera to raspberry pi<br>
weights = path of model
```
python detect.py --weights runs/train/exp/weights/best.pt --img 320 --conf 0.25 --source 0
```
