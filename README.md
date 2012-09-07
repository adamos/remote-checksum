remote-checksum
===============

The idea behind this is that we have a directory with multiple subdirectories
in a central server and we want to store the SHA1 checksums and file paths in
a text file and compare this text file to the checksums in the slave servers.

* TO DO:

1. Enable rsync pull from master server with ssh-keys to get the latest master.txt file
2. Change ARGV[0] to any directories specified in ARGV
3. Add email functionality when mismatched are found


I wrote this for Ruby 1.9.3




Output example: 

ruby sumchk-keys.rb

+++++ Truncating the text file checksums.txt ++++++

Examining ++ /home/adam/development ++

f0d4f357df88c14be626f2fa84cb6968b82deaf8 /home/adam/development/README.md (0)
ce2e5c2343188f2742527ef2d0dd88cfba915a0b /home/adam/development/sumchk-keys-find.rb (1)
2c7ff885b06d1fe7a055e67a1b0e042f3b916c29 /home/adam/development/Terzis Mpasis - Oti agapaw egw pe8ainei.mp3 (2)
be8233021f2f2508f200989a4bca5196e37dcb6a /home/adam/development/master.txt (3)
dfdb5f303325999fe4ff32e0a37279207575f4fe /home/adam/development/github/README.md (4)
bd8e7015f9a2078bce71fe868866f02dff34034e /home/adam/development/github/sumchk-keys.rb (5)
0d86a05861895d7f877747465697a8a06dfb92a4 /home/adam/development/Videos/1318871123_949488909.mp4 (6)
94554f1f8edc402582faffab00ce620cc34809f8 /home/adam/development/Videos/sample_mpeg4.mp4 (7)
d0de958f75c086faba99cd5eb97a27877138a58f /home/adam/development/Videos/video.mp4 (8)
05338592a8f3ecb50c34eec1b794649c52558136 /home/adam/development/sumchk-txf.rb.broken (9)
60764ad5989cdd0cc7b14b41dd17ce2dbe125f51 /home/adam/development/checksums.txt (10)
d906d7f71e45ee329adfdee733b806ef994e126d /home/adam/development/sumchk.rb (11)
bd8e7015f9a2078bce71fe868866f02dff34034e /home/adam/development/sumchk-keys.rb (12)
d3ca0e916bb6ed550931cd737cfaf775bc124c73 /home/adam/development/sumchk-txf.rb (13)


--------------- LOCAL -------------------

f0d4f357df88c14be626f2fa84cb6968b82deaf8 --> /home/adam/development/README.md
ce2e5c2343188f2742527ef2d0dd88cfba915a0b --> /home/adam/development/sumchk-keys-find.rb
2c7ff885b06d1fe7a055e67a1b0e042f3b916c29 --> /home/adam/development/Terzis Mpasis - Oti agapaw egw pe8ainei.mp3
be8233021f2f2508f200989a4bca5196e37dcb6a --> /home/adam/development/master.txt
dfdb5f303325999fe4ff32e0a37279207575f4fe --> /home/adam/development/github/README.md
bd8e7015f9a2078bce71fe868866f02dff34034e --> /home/adam/development/sumchk-keys.rb
0d86a05861895d7f877747465697a8a06dfb92a4 --> /home/adam/development/Videos/1318871123_949488909.mp4
94554f1f8edc402582faffab00ce620cc34809f8 --> /home/adam/development/Videos/sample_mpeg4.mp4
d0de958f75c086faba99cd5eb97a27877138a58f --> /home/adam/development/Videos/video.mp4
05338592a8f3ecb50c34eec1b794649c52558136 --> /home/adam/development/sumchk-txf.rb.broken
60764ad5989cdd0cc7b14b41dd17ce2dbe125f51 --> /home/adam/development/checksums.txt
d906d7f71e45ee329adfdee733b806ef994e126d --> /home/adam/development/sumchk.rb
d3ca0e916bb6ed550931cd737cfaf775bc124c73 --> /home/adam/development/sumchk-txf.rb


-------------- MASTER ----------------

d906d7f71e45ee329adfdee733b806ef994e126d --> /home/adam/development/sumchk.rb
05338592a8f3ecb50c34eec1b794649c52558136 --> /home/adam/development/sumchk-txf.rb.broken
dc8ce8df209a8636c197f12e2610a1216891704b --> /home/adam/development/sumchk-keys.rb
d3ca0e916bb6ed550931cd737cfaf775bc124c73 --> /home/adam/development/sumchk-txf.rb

+++ Mismatching checksums found!!

f0d4f357df88c14be626f2fa84cb6968b82deaf8  ==> /home/adam/development/README.md
ce2e5c2343188f2742527ef2d0dd88cfba915a0b  ==> /home/adam/development/sumchk-keys-find.rb
2c7ff885b06d1fe7a055e67a1b0e042f3b916c29  ==> /home/adam/development/Terzis Mpasis - Oti agapaw egw pe8ainei.mp3
be8233021f2f2508f200989a4bca5196e37dcb6a  ==> /home/adam/development/master.txt
dfdb5f303325999fe4ff32e0a37279207575f4fe  ==> /home/adam/development/github/README.md
bd8e7015f9a2078bce71fe868866f02dff34034e  ==> /home/adam/development/sumchk-keys.rb
0d86a05861895d7f877747465697a8a06dfb92a4  ==> /home/adam/development/Videos/1318871123_949488909.mp4
94554f1f8edc402582faffab00ce620cc34809f8  ==> /home/adam/development/Videos/sample_mpeg4.mp4
d0de958f75c086faba99cd5eb97a27877138a58f  ==> /home/adam/development/Videos/video.mp4
60764ad5989cdd0cc7b14b41dd17ce2dbe125f51  ==> /home/adam/development/checksums.txt
bd8e7015f9a2078bce71fe868866f02dff34034e  ==> /home/adam/development/sumchk-keys.rb
