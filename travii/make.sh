mkdir $HOME/release
rm -r $HOME/release/*

# 2422
cd forge
git checkout 0965ebae0942421628810aff1a5360b4ae8715b9
cd ..
git pull origin master
./gradlew --parallel -PofficialBuild clean setupCauldron --parallel jar packageBundle
cp build/distributions/Contigo*server* $HOME/release/Contigo-1.10.2-2422-server.jar
cd build/distributions/
unzip Contigo*bundle*zip
rm -r bin/unknown
mv bin libraries
zip -r libraries.zip libraries
cp libraries.zip $HOME/release
