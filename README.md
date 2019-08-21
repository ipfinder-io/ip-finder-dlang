<img src='https://camo.githubusercontent.com/46886c3e689a0d4a3f6c0733d1cab5d9f9a3926d/68747470733a2f2f697066696e6465722e696f2f6173736574732f696d616765732f6c6f676f732f6c6f676f2e706e67' height='60' alt='IP Finder'></a>
#  IPFinder D Client Library

The official D client library for the [IPFinder.io](https://ipfinder.io) get details for :
-  IP address details (city, region, country, postal code, latitude and more ..)
-  ASN details (Organization name, registry,domain,comany_type, and more .. )
-  Firewall by supported formats details (apache_allow,  nginx_deny, CIDR , and more ..)
-  IP Address Ranges by the Organization name  details (list_asn, list_prefixes , and more ..)
-  service status details (queriesPerDay, queriesLeft, key_type, key_info)
- Get Domain IP (asn, organization,country_code ....)
- Get Domain IP history (total_ip, list_ip,organization,asn ....)
- Get list Domain By ASN, Country,Ranges (select_by , total_domain  , list_domain ....)

## Getting Started
singup for a free account at [https://ipfinder.io/auth/signup](https://ipfinder.io/auth/signup), for Free IPFinder API access token.

The free plan is limited to 4,000 requests a day, and doesn't include some of the data fields
To enable all the data fields and additional request volumes see [https://ipfinder.io/pricing](https://ipfinder.io/pricing).

## Documentation

See the [official documentation](https://ipfinder.io/docs).

## Installation
Installing using dub:
```bash
$ dub add ipfinder
```

## With `free` TOKEN
```d
import std.stdio : stdout, stderr;
import ipfinder;
import std.json;

void main()
{
        Ipfinder ipfinder = new Ipfinder(); //  emty token == free

        try {
            // lookup your IP address information
            JSONValue response = ipfinder.authentication();

            // dump data
            writeln(response);

            //  print city
            writeln(auth.object["city"]);

        } catch (Exception e) {
            // Handle error
        }

}
```

## Authentication
```d
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
```

## Get IP address
```d
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
```

## Get ASN
This API available as part of our Pro and enterprise [https://ipfinder.io/pricing](https://ipfinder.io/pricing).
```d
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
```

## Firewall
This API available as part of our  enterprise [https://ipfinder.io/pricing](https://ipfinder.io/pricing).
formats supported are :  `apache_allow`, `apache_deny`,`nginx_allow`,`nginx_deny`, `CIDR`, `linux_iptables`, `netmask`, `inverse_netmask`, `web_config_allow `, `web_config_deny`, `cisco_acl`, `peer_guardian_2`, `network_object`, `cisco_bit_bucket`, `juniper_junos`, `microtik`
```d
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

```

## Get IP Address Ranges
This API available as part of our  enterprise [https://ipfinder.io/pricing](https://ipfinder.io/pricing).
```d
import std.stdio : stdout, stderr;
import ipfinder;
import std.json;

void main()
{
        Ipfinder ipfinder = new Ipfinder("YOUR_TOKEN_GOES_HERE");

        try {

            string org = "Telecom Algeria";

            JSONValue response = ipfinder.getRanges(org);

            // print data
            writeln(response);

        } catch (Exception ex) {
            // Handle error
            writeln(e);
        }

}
```

## Get service status
```d
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
```

## Get Domain IP

```d
import std.stdio : stdout, stderr;
import ipfinder;
import std.json;

void main()
{
        Ipfinder ipfinder = new Ipfinder("YOUR_TOKEN_GOES_HERE");

        try {

            string name = "google.com";

            JSONValue response = ipfinder.getDomain(name);

            // print data
            writeln(response);

        } catch (Exception ex) {
            // Handle error
            writeln(e);
        }

}
```

## Get Domain IP history


```d
import std.stdio : stdout, stderr;
import ipfinder;
import std.json;

void main()
{
        Ipfinder ipfinder = new Ipfinder("YOUR_TOKEN_GOES_HERE");

        try {

            string name = "google.com";

            JSONValue response = ipfinder.getDomainHistory(name);

            // print data
            writeln(response);

        } catch (Exception ex) {
            // Handle error
            writeln(e);
        }

}
```

## Get list Domain By ASN, Country,Ranges

```d
import std.stdio : stdout, stderr;
import ipfinder;
import std.json;

void main()
{
        Ipfinder ipfinder = new Ipfinder("YOUR_TOKEN_GOES_HERE");

        try {
            string by = "DZ";

            JSONValue response = ipfinder.getDomainBy(by);

            // print data
            writeln(response);

        } catch (Exception ex) {
            // Handle error
            writeln(e);
        }

}
```

## Add proxy
```d
Ipfinder ipfinder = new Ipfinder("YOUR_TOKEN_GOES_HERE", "https://ipfinder.yourdomain.com");
```

Sample codes under **examples/** folder.


## Contact

Contact Us With Additional Questions About Our API, if you would like more information about our API that isn’t available in our IP geolocation API developer documentation, simply [contact](https://ipfinder.io/contact) us at any time and we’ll be able to help you find what you need.

## License
----

[![GitHub license](https://img.shields.io/github/license/ipfinder-io/ip-finder-dlang.svg)](https://github.com/ipfinder-io/ip-finder-dlang)
