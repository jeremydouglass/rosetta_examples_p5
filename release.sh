#!/usr/bin/env bash

zip -r ../processing_rosetta_examples.zip . -x "*.git*" -x "*.DS_Store" -x "*.sh"

# In order to release
# 
# 1. check out a clean master (with no pending files)
# 2. update the version number in processing_rosetta_examples.txt
# 3. run the release script in the repo root -- this generates the zip outside
# 4. on gihub, create a new release tagged e.g. v0.4
# 5. add two assets as attachments:
#    -  processing_rosetta_examples.txt
#    -  processing_rosetta_examples.zip
# 
# Done! The "latest" path will automatically point to the newest release
# and its download assets -- this will update what PDE displays and loads.
