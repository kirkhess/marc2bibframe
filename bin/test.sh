set -e
set -o pipefail

zorba -i -f -q xbin/zorba.xqy -e marcxmluri:="http://lccn.loc.gov/2011276039/marcxml" -e serialization:="rdfxml" -e baseuri:="http://bibframe.org/" >/dev/null
if [ $? == 0 ]; then 
   echo "Zorba success" 
fi

zorba -i -f -q xbin/zorba3-0.xqy -e marcxmluri:="http://lccn.loc.gov/2011276039/marcxml" -e serialization:="rdfxml" -e baseuri:="http://bibframe.org/" >/dev/null

if [ $? == 0 ]; then
   echo "Zorba3 success"
fi

java -cp ~/.m2/repository/net/sf/saxon/Saxon-HE/9.5.1-8/Saxon-HE-9.5.1-8.jar net.sf.saxon.Query xbin/saxon.xqy marcxmluri="http://lccn.loc.gov/2011276039/marcxml" >/dev/null

if [ $? == 0 ]; then
   echo "Saxon success"
fi

