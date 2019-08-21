import std.stdio : stdout, stderr;
import ipfinder;
import std.json;


// lookup IP address information
void main()
{
        Ipfinder ipfinder = new Ipfinder("YOUR_TOKEN_GOES_HERE");

        try {

            // lookup your IP address information
            string ip = "5.2.0.2";

            JSONValue response = ipfinder.getAddressInfo(ip);

            writeln(response);

            // print city name
            writeln(response.getCity());

        } catch (Exception e) {
            // Handle error
        }

}
