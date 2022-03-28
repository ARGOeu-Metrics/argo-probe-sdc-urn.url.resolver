Name:		argo-probe-sdc-urn.url.resolver
Version:	1.0.0
Release:	2%{?dist}
Summary:	Monitoring Metrics for nvs2. URN URL Resolver
License:	GPLv3+
Packager:	Themis Zamani <themiszamani@gmail.com>

Source:		%{name}-%{version}.tar.gz
BuildArch:	noarch
BuildRoot:	%{_tmppath}/%{name}-%{version}
Requires(pre):  xmlstarlet
AutoReqProv: no

%description
Monitoring Metrics for nvs2. URN URL Resolver. It checks if URL Url resolver exists.  

%prep
%setup -q

%define _unpackaged_files_terminate_build 0 

%install

install -d %{buildroot}/%{_libexecdir}/argo/probes/sdc-urn.url.resolver
install -m 755 urn_url_resolver.sh %{buildroot}/%{_libexecdir}/argo/probes/sdc-urn.url.resolver/urn_url_resolver.sh

%files
%dir /%{_libexecdir}/argo
%dir /%{_libexecdir}/argo/probes/
%dir /%{_libexecdir}/argo/probes/sdc-urn.url.resolver

%attr(0755,root,root) /%{_libexecdir}/argo/probes/sdc-urn.url.resolver/urn_url_resolver.sh


%changelog
* Mon Mar 28 2022 Themis Zamani <themiszamani@gmail.com>  - 1.0.0-2%{?dist}
- Update the package based on the new monitoring rules. Work done by Anastasios Lisgaras - tasos@grnet.gr 

* Thu Jun 01 2021 Themis Zamani <themiszamani@gmail.com>  - 1.0.0-1%{?dist}
- Initial version of the package. Work done by Anastasios Lisgaras - tasos@grnet.gr 
