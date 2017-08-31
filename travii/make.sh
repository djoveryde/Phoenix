mkdir $HOME/release
rm -r $HOME/release/*

# 2422
cd forge
git checkout c6aa04325e8a80af88755adb2339a402e7e90ebb
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
