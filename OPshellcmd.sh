#  Last cmd as root
sudo !!

# open last command in text editor
fc


# Create a ram disk for temporary file high speed I/O

# mount -type temporary with read/write of size 1 G at path
sudo mkdir -p /mnt/vidange
sudo mount -t tmpfs -o rw,size=1G tmpfs /mnt/vidange/

# Erase all data at unmount
sudo umount /mnt/vidange

# map a local port(relative to the machine) to a remote server/host on cloud
# with ssh -> ex remote to 127.0.0.1 on port 6379
# WITHOUT EXPOSING PUBLICLY THAAT PORT
ssh -L 3337:127.0.0.1:6379 root@somewhere.org -N

# disown all progress without hanging up (SIGHUP)
disown -a && exit
