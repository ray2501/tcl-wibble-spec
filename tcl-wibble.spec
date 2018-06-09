#
# spec file for package tcl-wibble
#

%define packagename wibble

Name:           tcl-wibble
Url:            http://chiselapp.com/user/andy/repository/wibble
BuildRequires:  tcl >= 8.6
Version:        0.4
Release:        0
BuildRoot:      %{_tmppath}/%{name}-%{version}-build
Summary:        A small, pure-Tcl web server
License:        TCL
Group:          Development/Libraries/Tcl
BuildArch:      noarch
Requires:       tcl >= 8.6
Source0:        %name-%version.tar.gz

%description
Wibble is a small, pure-Tcl web server inspired by Wub, DustMote, 
Coronet, and Templates and subst.

%prep
%setup -q %name-%version

%build

%install
mkdir -p %buildroot%_datadir/tcl/%{packagename}%{version}
cp pkgIndex.tcl %buildroot%_datadir/tcl/%{packagename}%{version}
cp wibble.tcl %buildroot%_datadir/tcl/%{packagename}%{version}

%files
%defattr(-,root,root)
%_datadir/tcl

%changelog
