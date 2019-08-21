module Validation.Tokenvalidation;

import std.string;
import core.stdc.string : strlen;
import std.conv : to;


/**
 * Tokenvalidation
 */
class Tokenvalidation
{
	/**
	 * Helper method for validating an IPFINDER TOKEN string
	 *
	 */
    static int validate(string token)
    {
    	auto p = toStringz(token);
        if (strlen(p) <= 25)
        {
        	throw new Exception("Invalid IPFINDER API Token");
        }
        return true;
    }
}
