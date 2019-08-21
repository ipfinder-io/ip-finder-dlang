module Validation.Asnvalidation;

import std.regex;
import std.stdio;


/**
 * Asnvalidation
 */
class Asnvalidation
{
	/**
	 * Helper method for validating an argument if it is asn number
	 *
	 */
    static int validate(string asn)
    {
        if (!matchAll(asn, regex(`^(as|AS)(\d+)$`)))
        {
        	//writeln("NOT MATCH");
        	throw new Exception("Invalid asn number");
        }

        return true;
    }
}
