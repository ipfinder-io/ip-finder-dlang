import ipfinder;

void main()
{
    Ipfinder ipfinder = new Ipfinder();
    JSONValue a = ipfinder.Authentication();
    // writeln(a);
    writeln(a.object["city"]);
}
