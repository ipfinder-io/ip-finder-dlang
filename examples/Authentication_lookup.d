import std.stdio : stdout, stderr;
import ipfinder;
import std.json;


void main()
{
        Ipfinder ipfinder = new Ipfinder("YOUR_TOKEN_GOES_HERE");

        try {
            // lookup your IP address information
            JSONValue response = ipfinder.authentication();

            writeln(response);

            // print city name
            writeln(response.getCity());

        } catch (Exception e) {
            // Handle error
        }

}
