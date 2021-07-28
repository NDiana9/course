cd temp
mkdir temp_folder{1,2,3}
cd temp_folder1
touch file{1,2,3}.txt file{1,2}.json
mkdir child_temp_folder{1,2,3}
ls -lha
mv file{1,2}.json ./child_temp_folder3
