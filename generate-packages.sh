rm -r packages

for i in {1..10}
do

mkdir -p packages/package-$i
pushd packages/package-$i

yarn init
sed -i 's/}/,\n  "scripts": {\
    "test": "yarn g:jest"\
  }}/' package.json

cp ../../template/file.test.js .

popd


done

yarn # Generate lockfile