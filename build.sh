#!/bin/bash
xml2rfc --text arin-rdap-originas.xml
xml2rfc --html arin-rdap-originas.xml
reverse_markdown arin-rdap-originas.html > arin-rdap-originas.md
