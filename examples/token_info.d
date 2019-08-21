import std.stdio : stdout, stderr;
import ipfinder;
import std.json;

void main()
{
        Ipfinder ipfinder = new Ipfinder("YOUR_TOKEN_GOES_HERE");

        try {

            JSONValue response = ipfinder.getStatus();

            // print data
            writeln(response);
        } catch (Exception ex) {
            // Handle error
            writeln(e);
        }

}
