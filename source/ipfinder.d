module ipfinder;

/+
 * Authors: Mohamed Ben rebia, mohamed@ipinfo.io
 * Version: 1.0.0
 * Copyright: Apache-2.0
 +/


import std.stdio;
import std.net.curl;
import std.json : JSONValue, parseJSON;
import std.string;
import std.array : split;
import std.uri : encode;
import std.exception;

import Validation.Asnvalidation;
import Validation.Domainvalidation;
import Validation.Firewallvalidation;
import Validation.Ipvalidation;
import Validation.Tokenvalidation;
import info;
//import Exception.IPfinderException;


struct Json {
    JSONValue all;
}

/+
 * Ipfinder
 +/
class Ipfinder
{
    /+
       DEFAULT BASE URL
     +/
    const string DEFAULT_BASE_URL = "https://api.ipfinder.io/v1/"; // or add proxy pass with your domain

    /+
     The free token
     +/

    const string DEFAULT_API_TOKEN = "free"; //  limited to 4,000 requests a day

    /+
       DEFAULT FORMAT
     +/
    const string FORMAT = "json";

    /+
       service status path
     +/
    const string STATUS_PATH = "info";

    /+
       IP Address Ranges path
     +/
    const string RANGES_PATH = "ranges/";

    /+
       Firewall path
     +/
    const string FIREWALL_PATH = "firewall/";

    /+
       Domain IP path
     +/
    const string DOMAIN_PATH = "domain/";

    /+
        Domain IP history path
     +/
    const string DOMAIN_H_PATH = "domainhistory/";

    /+
       Domain By ASN, Country,Ranges path
     +/
    const string DOMAIN_BY_PATH = "domainby/";


    public string token;

    public string baseUrl;

    public string format;

    public string endpoint;

    public JSONValue body;


    public this(string token = null, string baseUrl = null)
    {
    	if (token == null)
    	{
    		this.token = DEFAULT_API_TOKEN;
    	}
    	else
    	{
    		Tokenvalidation.validate(token);
    		this.token = token;
    	}
    	if (baseUrl == null)
    	{
    		this.baseUrl = DEFAULT_BASE_URL;
    	}
    	else
    	{
    		this.baseUrl = baseUrl;
    	}
    }

    /+
     
     +/
    public void call(string path = null, string format = null)
    {

    	if (format == null)
    	{
    		this.format = FORMAT;
    	}
    	else
    	{
    		this.format = format;
    	}

    	auto http = HTTP();
    	http.addRequestHeader("Content-Type", "application/json");
    	http.addRequestHeader("User-Agent", "IPfinder dlang-client");
		

		this.endpoint = join([this.baseUrl,path]);
			auto content = post(this.endpoint, `{"token": "free", "foramt" :"json"}`, http);

			auto status = http.statusLine().code;
			
			if (status != 200)
			{
				throw new Exception("");
			}
			else
			{
                JSONValue body = parseJSON(content);
                Json data;

                data.all = body;

			   //	writeln(this.data);
               // writeln(this.data["continent_code"].str());
			}

    	//auto content = post(this.baseUrl + path, http);


    }

    /+
     
     +/
    public void Authentication()
    {
    	return call();
    }

    /+
     
     +/
    public void getAddressInfo(string path)
    {
    	Ipvalidation.validate(path);
    	return call(path);
    }

    /+
     
     +/
    public void getAsn(string path)
    {
    	Asnvalidation.validate(path);
    	return call(path);
    }

    /+
     
     +/
    public void getStatus()
    {
    	return call(STATUS_PATH);
    }

    /+
     
     +/
    public void getRanges(string path)
    {
    	return call(join([RANGES_PATH,path.encode]));
    }

    /+
     
     +/
    public void getFirewall(string path, string formats)
    {
    	Firewallvalidation.validate(path,formats);
    	return call(join([FIREWALL_PATH,path]),formats);
    }

    /+
     
     +/
    public void getDomain(string path)
    {
    	Domainvalidation.validate(path);
    	return call(join([DOMAIN_PATH,path]));
    }

    /+
     
     +/
    public void getDomainHistory(string path)
    {
    	Domainvalidation.validate(path);
    	return call(join([DOMAIN_H_PATH,path]));
    }

    /+
     
     +/
    public void getDomainBy(string path)
    {
    	return call(join([DOMAIN_BY_PATH,path]));
    }
  }



void main()
{
	Ipfinder ipfinder = new Ipfinder();
	ipfinder.Authentication();
    
}