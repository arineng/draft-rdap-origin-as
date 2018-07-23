| | A. Newton |
| | ARIN |
| | July 23, 2018 |

Expressing Registry Origin AS Information in RDAP  
arin-rdap-originas-00

# Abstract

This document describes an extension to RDAP to query and express origin autonomous system numbers placed on network registrations.

* * *

# Table of Contents

- 1. Introduction
- 2. RDAP Extension Identifier
- 3. Networks By Origin AS Query
- 4. Networks and Orgin AS Information in RDAP

  - 4.1. Network Search Results
  - 4.2. Origin AS Numbers
  - 4.3. Example Result
- 5. IANA Considerations
- 6. Normative References
- Author's Address

# 1. Introduction

Since 2007, The American Registry for Internet Numbers (ARIN) has accepted a list of Autonomous System (AS) numbers as an attribute of network objects when they are registered. The intent of these AS numbers is to signify an AS originating a route for the network. This document specifies an extension to express this information in RDAP network objects and a method to query RDAP network objects registered with these AS numbers.

# 2. RDAP Extension Identifier

This document uses the RDAP extension identifier "arin\_originas0" in accordance with Section 5 of RFC 7482 and Section 2.1 of RFC 7483. The registration for the identifier can be found in Section 5 in accordance with Section 8.1 of RFC 7480.

# 3. Networks By Origin AS Query

While RDAP has defined queries to retreive networks and autonomous system numbers by their identifiers, the base RDAP specification does not contain a query to retreive a set of network objects for which an AS number has been associated as an origination in network routing.

This extension defines a query to retreive a set of network objects given an AS number, where the AS number has been registered as originating a route (i.e. origin AS). This query has the following syntax:

arin\_originas0\_networksbyoriginas/\<autonomous system number\>

An example would be:

https://rdap.arin.net/registry/arin\_originas0\_networksbyoriginas/65538

The expected result from the query is defined in Section 4.

# 4. Networks and Orgin AS Information in RDAP

This extension defines two new JSON data structures for RDAP. The first is an array of networks (similar to the arrays found in Section 8 of RFC 7483, and the second is an array of origin AS numbers to be placed in network objects.

The formal syntax specified in JSON Content Rules (JCR) using rules from RDAP JCR follows.

    #{ import https://raw.githubusercontent.com/arineng/draft-rdap-jcr/master/jcr/rdap\_all.jcr as rdap\_base } $networkSearchResults = "arin\_originas0\_networkSearchResults" : [$rdap\_base.network\_oc \*] $origin\_autnums = "arin\_originas0\_originautnums" : [integer \*] 

Figure 1: Formal Syntax in JCR

# 4.1. Network Search Results

The set of networks returned by the query in Section 3 is represented by an array named "arin\_originas0\_networkSearchResults". Each item of the array is to be an IP network as defined by Section 5.4 of RFC 7483.

The formal syntax definition is $networkSearchResults in Figure 1.

# 4.2. Origin AS Numbers

Each IP network defined in Section 5.4 of RFC 7483 may contain an array named "arin\_originas0\_originautnums". This array contains number reprensenting an Autonomous System (AS). The array may be empty, but if allowed by policy should always be present in both the result of query specified in Section 3 and any other RDAP query where an IP network object is given.

The formal syntax definition is $origin\_autnums in Figure 1.

# 4.3. Example Result

The following is an elided example of a query returning an "arin\_originas0\_networkSearchResults" result.

    { "rdapConformance" : ["rdap\_level\_0", "arin\_originas0"], "arin\_originas0\_networkSearchResults" : [{ "objectClassName" : "ip network", "handle" : "XXXX-2", "startAddress" : "2001:db8::", "endAddress" : "2001:db8:0::ffff", "ipVersion" : "v6", "arin\_originas0\_originautnums" : [ 12, 65538], ... }, ... ] } 

Figure 2: Elided IP Network Example

# 5. IANA Considerations

The information below will be registered with the IANA according to the section 8.1 of RFC 7480.

Extension identifier: arin\_originas0

Registry operator: American Registry for Internet Numbers

Published specification: this document

Person & email address to contact for further information: andy@arin.net

Intended usage: common.

# 6. Normative References

| **[1]** | Bray, T., "[The JavaScript Object Notation (JSON) Data Interchange Format](https://tools.ietf.org/html/rfc7159)", RFC 7159, DOI 10.17487/RFC7159, March 2014. |
| **[2]** | Newton, A., Ellacott, B. and N. Kong, "[HTTP Usage in the Registration Data Access Protocol (RDAP)](https://tools.ietf.org/html/rfc7480)", RFC 7480, DOI 10.17487/RFC7480, March 2015. |
| **[3]** | Newton, A. and S. Hollenbeck, "[Registration Data Access Protocol (RDAP) Query Format](https://tools.ietf.org/html/rfc7482)", RFC 7482, DOI 10.17487/RFC7482, March 2015. |
| **[4]** | Newton, A. and S. Hollenbeck, "[JSON Responses for the Registration Data Access Protocol (RDAP)](https://tools.ietf.org/html/rfc7483)", RFC 7483, DOI 10.17487/RFC7483, March 2015. |
| **[5]** | Newton, A. and P. Cordell, "[A Language for Rules Describing JSON Content](https://tools.ietf.org/html/draft-newton-json-content-rules-09)", Internet-Draft draft-newton-json-content-rules-09, September 2017. |
| **[6]** | Newton, A., "[A Description of RDAP JSON Messages Using JSON Content Rules](https://tools.ietf.org/html/draft-newton-rdap-jcr-06)", Internet-Draft draft-newton-rdap-jcr-06, January 2018. |

# Author's Address

<address class="vcard">
	<span class="vcardline">
	  <span class="fn">Andrew Lee Newton</span> 
	  <span class="n hidden">
		<span class="family-name">Newton</span>
	  </span>
	</span>
	<span class="org vcardline">American Registry for Internet Numbers</span>
	<span class="adr">
	  <span class="vcardline">PO Box 232290</span>

	  <span class="vcardline">
		<span class="locality">Centerville</span>,  
		<span class="region">VA</span> 
		<span class="code">20120</span>
	  </span>
	  <span class="country-name vcardline">US</span>
	</span>
	<span class="vcardline">EMail: <a href="mailto:andy@arin.net">andy@arin.net</a></span>

<span class="vcardline">URI: <a href="http://www.arin.net">http://www.arin.net</a></span>

  </address>
