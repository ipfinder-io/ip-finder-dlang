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
//<?php
//namespace ipfinder\ipfinder\Validation;

//use ipfinder\ipfinder\Exception\IPfinderException;

///**
// *  class Tokenvalidation
// */
//class Tokenvalidation
//{

//    *
//     * Helper method for validating an IPFINDER TOKEN string
//     *
//     * @param mixed     $argument
//     * @return bool
     
//    public static function validate($argument)
//    {
//        if (strlen($argument) <= 25) {
//            throw new IPfinderException("\e[0;37;41mInvalid IPFINDER API Token\e[0m");
//        }
//        return true;
//    }
//}
