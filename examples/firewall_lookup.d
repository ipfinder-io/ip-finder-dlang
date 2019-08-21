import std.stdio : stdout, stderr;
import ipfinder;
import std.json;

void main()
{
        Ipfinder ipfinder = new Ipfinder("YOUR_TOKEN_GOES_HERE");

        try {

            string asn = "as36947";

            string format = "nginx_deny";

            string response = ipfinder.getFirewall(asn,format);

            // print data
            writeln(response);

        } catch (Exception ex) {
            // Handle error
            writeln(e);
        }

}
