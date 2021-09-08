rm -r packages

N=$1

# Generate arbitrary base package
PACKAGE_NAME="base"
echo Generating $PACKAGE_NAME
mkdir -p packages/$PACKAGE_NAME
pushd packages/$PACKAGE_NAME
yarn init
popd

# Generate the packages
for i in $(seq 1 $N)
do

PACKAGE_NAME=package-$i

# Add workspace dependency
if [ $i -gt 4 ]; then
DEPENDENCY=package-$(( $(expr $i % 4) + 1))
else
DEPENDENCY="base"
fi

echo Generating $PACKAGE_NAME with dependency on $DEPENDENCY

mkdir -p packages/$PACKAGE_NAME
pushd packages/$PACKAGE_NAME > /dev/null

yarn init
sed -i "s/}/, \
  \"scripts\": { \
    \"test\": \"yarn g:jest\" \
  }, \
  \"dependencies\": { \
    \"$DEPENDENCY\": \"workspace:*\" \
  } \
}/" package.json

cp ../../template/file.test.js .

popd > /dev/null

done

yarn # Generate lockfile

