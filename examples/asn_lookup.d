import std.stdio : stdout, stderr;
import ipfinder;
import std.json;


// lookup Asn information
void main()
{
        Ipfinder ipfinder = new Ipfinder("YOUR_TOKEN_GOES_HERE");

        try {
            // lookup Asn information
            string asn = "as36947";

            JSONValue response = ipfinder.getAsn(asn);

            // print data
            writeln(response);

        } catch (Exception e) {
            // Handle error
        }

}
