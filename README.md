# ZerobraneXmlTagCompletion
Automatically adds closing tags for HTML/XML

Now scans entire document when deciding whether or not to place a closing tag, in addition to the current line.

If a second tag is really intended to be placed that is identical to one already present in the file, pressing the '>' key a second time will override the default behavior and place an nth closing tag. It will then delete the extra chevron automatically.

Sets of tags still need to be entered one set per line for the script to behave as intended. Trying to do <tag1><tag2></tag2></tag1> is still beyond the scope of this script.
