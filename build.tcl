#!/usr/bin/tclsh

set arch "x86_64"
set base "tcl-wibble-0.4"
set fileurl "http://chiselapp.com/user/andy/repository/wibble/raw/wibble.tcl?name=c5d8adb79a450084894529a0f8c1cbd1586d5fba"

set curDir [pwd]
file mkdir $base
cd $base
set var [list wget $fileurl -O wibble.tcl]
exec >@stdout 2>@stderr {*}$var

set var [list echo {package ifneeded wibble 0.4 [list source [file join $dir wibble.tcl]]} > pkgIndex.tcl]
exec >@stdout 2>@stderr {*}$var
cd $curDir

set var [list tar czvf $base.tar.gz $base]
exec >@stdout 2>@stderr {*}$var

if {[file exists build]} {
    file delete -force build
}

file mkdir build/BUILD build/RPMS build/SOURCES build/SPECS build/SRPMS
file copy -force $base.tar.gz build/SOURCES

set buildit [list rpmbuild --target $arch --define "_topdir [pwd]/build" -bb tcl-wibble.spec]
exec >@stdout 2>@stderr {*}$buildit

# Remove our source code
file delete -force $base
file delete $base.tar.gz
