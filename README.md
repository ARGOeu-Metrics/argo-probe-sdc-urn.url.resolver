# sdc-urn-url-resolver
A nagios plugin for a urn url resolver.
Check if `URN / URL Resolver` is contained in the HTML head title.


## Requirements

* Bash


## How to use it

```
urn_url_resolver.sh -h

Usage:  [options]
Script that takes as argument a URL
and checks if the html head contains the 'URN / URL Resolver'

Options:
  -u, --url <URL>                       URL to check
  -t, --connect-timeout <seconds>       Maximum time allowed for connection (default: 10s)
  -h, --help                            Print this help text.
```

* **UNKNOWN**
```
./urn_url_resolver.sh
UNKNOWN - No URL is defined | UNKNOWN - No URL is defined
```

* **OK**
```
urn_url_resolver.sh -u https://www.seadatanet.org/urnurl/
OK - HTML 'head title' is 'URN / URL Resolver' | http_status_code=200
```

* **Critical**
```
urn_url_resolver.sh -u https://example.com
Critical - HTML 'head title' is NOT 'URN / URL Resolver' | http_status_code=200
```



