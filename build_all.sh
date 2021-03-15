/usr/local/bin/packer build --force vbox-2012r2.json
/usr/local/bin/packer build --force vbox-2016.json

# clean up after packer
rm -rf packer_cache/port/*