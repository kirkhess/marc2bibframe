[![Build Status](https://travis-ci.org/kirkhess/marc2bibframe.svg?branch=master)](https://travis-ci.org/kirkhess/marc2bibframe)

XQuery utility to convert MARC/XML Bibliographic records to BIBFRAME resources.

This XQuery version was developed by the Library of Congress Network 
Development and MARC Standards Office.  This transformation is under 
development and does not at this time represent a canonical transformation 
of MARC Bib data to BIBFRAME resources. It is made available for 
evaluation and comment.

NOTE: The Python version of this code was split off into its own repository.
See http://github.com/lcnetdev/marc2bibframe-python

Xquery scripts are provided for MarkLogic, Saxon, and Zorba.


Parameters (HTTP for ml.xqy; external for saxon.xqy; external for zorba.xqy):

	marcxmluri 	- Path to MARC/XML file.  File can be retrieved over 
				  HTTP (begin http://) or from the filesystem. 
	baseuri 	- Base URI for generated resources. Default is http://example.org
	serialization 	- rdfxml (default), rdfxml-raw, ntriples, json, exhibitJSON
			  rdfxml=flattened RDF/XML, everything has an identifier
			  rdfxml-raw=Verbose, cascaded output.
	usebnodes 	- true/false(default). Whether bnodes should identify resources instaed of http URIs. 
	


Specific Processor Notes

	ml.xqy - intended for the MarkLogic Database and Application 
		Server (http://community.marklogic.com/docs).  This expects an HTTP 
		application server.  Set up an application server with the location 
		of this package 
		as the root and (purely as an example) go to 

	http://hostname:port/ml.xqy?marcxmluri=http://location/of/marcxml.xml&serialization=ntriples&baseuri=http://base-uri/


	saxon.xqy can be used with the Saxon XSLT and Xquery Processor.  This 
		has been tested using the Saxon processor in Eclipse and Oxygen. 
		This requires a saxon9he.jar version 9.5.x or earlier.  
		Saxon can be run from the command line or through either of the two 
		previously mentioned applications.  For more about Saxon see 
		http://saxon.sf.net/  
	
	java -cp /path/to/saxon9he.jar net.sf.saxon.Query saxon.xqy marcxmluri=/path/to/marc/xml/file baseuri=http://my-base-uri/ serialization=rdfxml

	saxon3.xqy can be used with the Saxon XSLT and XQuery processor version 9.6 or later and supports XQuery 3.0.
	
	zorba.xqy can be used with the Zorba Xquery processor.  
		For more about see http://www.zorba-xquery.com/  Run from the 
		command line with:
	
	zorba -i -f -q zorba.xqy -e marcxmluri:="http://location/of/marcxml.xml" -e serialization:="rdfxml" -e baseuri:="http://base/"




Exhibit Display

	To get the Exhibit display to work for the Xquery, set the serialization
	parameter to "exhibitJSON".
	
	The Exhibit JSON output should be saved as a file named
	
		data.json
	
	in the html/data directory.  You can copy and paste this into 
	the correctly named file or, if running the command line, pipe the output 
	to html/data/data.json.
	
	Afterwards, simply open the exhibit.html file in a browser.
	
	Note:  For Zorba and Saxon, you will need to add a runtime parameter
	to the command to instruct the processor to omit the XML declaration.
	
	For Saxon, add: '!method=text'
	E.g.: java -cp /path/to/saxon9he.jar net.sf.saxon.Query saxon.xqy '!method=text' [ other params, as above ]
	
	For Zorba, add: -r
	E,g,: zorba -i -r -f -q zorba.xqy [ other params, as above ]
	
	


Changes (Generally see the commit history http://github.com/lcnetdev/marc2bibframe/commits/master)

	Jun 5 2013
		Removed Python tree, see http://github.com/lcnetdev/marc2bibframe-python

	Mar 1 2013
		Output data in closer alignment with vocabulary terms.
		
	Jan 11 2013
		Exhibit JSON output plus Exhibit display.
		Default serialization is flattened RDF/XML (original, 
			verbose version is "raw")
		Added additional support for 630, 730, 740, 830 relationships.
		Bug fixes to work through Stanford MARC files.

	Dec 21 2012
		(Some) Support for 7XXs
		Support for 880s
		Added HierarchicalGeorgraphic support
		Do something with 264.
		
	Dec 6 2012
		Initial publication.
		
		
