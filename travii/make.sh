mkdir $HOME/release
rm -r $HOME/release/*

# 1558
cd forge
git checkout aa8eaf2b286e809146b7faf4e59ce801a40eab9b
cd ..
git pull origin master
./gradlew --parallel -PofficialBuild clean setupCauldron --parallel jar
cp build/distributions/Thermos*server* $HOME/release/Thermos-1.7.10-1558-server.jar

# 1614
cd forge
git checkout c6aa04325e8a80af88755adb2339a402e7e90ebb
cd ..
git pull origin master
./gradlew --parallel -PofficialBuild clean setupCauldron --parallel jar packageBundle
cp build/distributions/Thermos*server* $HOME/release/Thermos-1.7.10-1614-server.jar
cd build/distributions/
unzip Thermos*bundle*zip
rm -r bin/unknown
mv bin libraries
zip -r libraries.zip libraries
cp libraries.zip $HOME/release
