module Validation.Domainvalidation;

import std.regex;
import std.stdio;

/**
 * Domainvalidation
 */
class Domainvalidation
{
	/**
	 * Helper method for validating domain name
	 *
	 */
    static int validate(string domain)
    {
        if (!matchAll(domain, regex(`^/^(?!\-)(?:[a-zA-Z\d\-]{0,62}[a-zA-Z\d]\.){1,126}(?!\d+)[a-zA-Z\d]{1,63}$`)))
        {
        	throw new Exception("Invalid Domain name");
        }
        return true;
    }
}
