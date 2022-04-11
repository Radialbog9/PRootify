for file in `ls -l | awk '{ print $9 }'`
do
    sha256sum $file > $file.sha256
done