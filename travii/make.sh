mkdir $HOME/release
rm -r $HOME/release/*
# 1448
cd MinecraftForge
git checkout b3a1548cfaac77e9756168a8887270f8181487ad
cd ..
git pull origin 1.12.x
./gradlew --parallel -PofficialBuild clean setupCauldron --parallel jar
cp build/distributions/Thermos*server* $HOME/release/Thermos-1.12.1-1448-server.jar

# 1492
cd MinecraftForge
git checkout c308a47124394f025bc2ba553646ecf8b6c31ba2
cd ..
git pull origin 1.12.x
./gradlew --parallel -PofficialBuild clean setupCauldron --parallel jar
cp build/distributions/Thermos*server* $HOME/release/Thermos-1.12.1-1492-server.jar

# 1558
cd MinecraftForge
git checkout aa8eaf2b286e809146b7faf4e59ce801a40eab9b
cd ..
git pull origin 1.12.x
./gradlew --parallel -PofficialBuild clean setupCauldron --parallel jar
cp build/distributions/Thermos*server* $HOME/release/Thermos-1.12.1-1558-server.jar

# 1614
cd MinecraftForge
git checkout 52702e5cc9c629b3b2baff6a726aabb168aced16
cd ..
git pull origin 1.12.x
./gradlew --parallel -PofficialBuild clean setupCauldron --parallel jar packageBundle
cp build/distributions/Thermos*server* $HOME/release/Thermos-1.12.1-1614-server.jar
cd build/distributions/
unzip Thermos*bundle*zip
rm -r bin/unknown
mv bin libraries
zip -r libraries.zip libraries
cp libraries.zip $HOME/release
