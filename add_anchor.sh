cat unixshell.md| gawk 'BEGIN { whole = ""} END { print whole } /^=/ { print whole; print "0000" f "1111"; whole = ""} { f= $0; whole = whole $0 "\n" }'
