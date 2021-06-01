#!/bin/bash

#URL=https://www.seadatanet.org/urnurl/

# function for help message
usage () {
cat <<EOF
Usage: $me [options]
Script that takes as argument a URL
and checks if the html head contains the 'URN / URL Resolver'

Options:
  -u, --url <URL>                       URL to check
  -t, --connect-timeout <seconds>       Maximum time allowed for connection (default: 10s)
  -h, --help                            Print this help text.
EOF
}


# function for parsing arguments
POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -u|--url)
    URL="$2"
    shift # past argument
    shift # past value
    ;;
    -t|--connect-timeout)
    TIMEOUT="$2"
    if [ -z "$TIMEOUT" ] || [[ "$TIMEOUT" =~ ^-.* ]]
    then
        TIMEOUT=10      # if TIMEOUT is not set, but '-t' option is used, fall to default 10 seconds
        shift
    else
    shift # past argument
    shift # past value
    fi
    ;;
     -h|--help)
     usage; exit 3 ;;
    *)    # unknown option
    POSITIONAL+=("$1") # save it in an array for later
    shift # past argument
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters


# Check if required options are passed(empty or dash(-))
if [ -z "$URL" ] || [[ "$URL" =~ ^-.* ]]
  then
        echo "UNKNOWN - No URL is defined | UNKNOWN - No URL is defined"
        exit 3
fi
if [ -z "$TIMEOUT" ] || [[ "$TIMEOUT" =~ ^-.* ]]
 then
        TIMEOUT=10
fi





STATUS=$(curl -IL  -w '%{http_code}\n' -s -o /dev/null ${URL})


if  curl -sL ${URL} --connect-timeout $TIMEOUT | grep title | grep -q 'URN / URL Resolver'; 
	then
		echo "OK - HTML 'head title' is 'URN / URL Resolver' | http_status_code=${STATUS} "
		exit 0
	else
		echo "Critical - HTML 'head title' is NOT 'URN / URL Resolver' | http_status_code=${STATUS}"
		exit 2
fi

