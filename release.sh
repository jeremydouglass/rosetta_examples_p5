#!/usr/bin/env bash

RELD=release
ZIPD=processing_rosetta_examples

if [ -d $RELD/$ZIPD ]; then rm -Rf $RELD/$ZIPD; fi
mkdir -p $RELD/$ZIPD

cp examples.properties $RELD/$ZIPD.txt

cp -r examples $RELD/$ZIPD/examples
cp CONTRIBUTING.md $RELD/$ZIPD/
cp examples.properties $RELD/$ZIPD/
cp LICENSE.md $RELD/$ZIPD/
cp README.md $RELD/$ZIPD/

cd $RELD
if [ -f $ZIPD.zip ]; then rm $ZIPD.zip; fi
zip -r $ZIPD.zip $ZIPD -x "*.DS_Store" "*.git*"
rm -r $ZIPD

# In order to release
# 
# 1. check out a clean master (with no pending files)
# 2. update the version number in examples.properties
# 3. run the release script in the repo root -- this generates release files 
# 4. on gihub, create a new release tagged with the version, e.g. v0.4
# 5. add two release/ assets as attachments to the GitHub release:
#    -  processing_rosetta_examples.txt
#    -  processing_rosetta_examples.zip
# 
# Done! The "latest" path will automatically point to the newest release
# and its download assets -- this will update what PDE displays and loads.
