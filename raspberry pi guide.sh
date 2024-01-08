# install python11
sudo apt update
sudo apt install build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev curl
cd ~/Desktop
wget https://www.python.org/ftp/python/3.11.7/Python-3.11.7.tar.xz
tar -xf Python-3.11.7.tar.xz
cd ~/Desktop/Python-3.11.7
./configure
sudo make altinstall
sudo make install
python3 --version
# install yolo and dataset
cd ~/Desktop
wget https://ultralytics.com/assets/coco2017val.zip
unzip -q coco2017val.zip -d datasets && rm coco2017val.zip
git clone https://github.com/intelligentdesignhk/yolov5_colab.git  # clone
# run
cd ~/Desktop/yolov5_colab
python3 -m venv venv # create virtual env
source venv/bin/activate
pip install -qr requirements.txt comet_ml  # install python lib
# train model
# *trained model will save in ~/Desktop/yolov5_colab/runs/train
# *very slow on raspberry pi
python train.py --img 320 --batch 2 --epochs 3 --data coco_idt128.yaml --weights yolov5n.pt --cache 
# run 
# *Connect camera to raspberry pi
# *weights = path of model
# *img = detect image pixel
python detect.py --weights runs/train/exp/weights/best.pt --img 64 --conf 0.25 --source 0
