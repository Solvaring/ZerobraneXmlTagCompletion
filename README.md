# ZerobraneXmlTagCompletion
Automatically adds closing tags for HTML/XML

Version 3

autotag3.lua is the latest version. Version 3 now supports entering multiple elements per line, self-closing tags will not trigger the autocomplete behavior. The plugin scans the document when deciding wether or not to place closing tags. For instance, if I have:

```
<GuiXml>
</GuiXml>
```
Attempting to start another ` <GuiXml> ` tag you will not get autocomplete because it detects a closing tag already in the doc for ` <GuiXml> `

To Override this behavior just type an extra Chevron ">" ` <GuiXml>> ` will become ` <GuiXml></GuiXml> `

This behavior is actually held over from older versions, I can't remember what purpose it served at the time. If enough people complain to me about its annoyance then I can remove it but I swear it had an important reason at one time or another so I'm a bit cautious to do away with it.

=====================================================================================================

Version 2

Now scans entire document when deciding whether or not to place a closing tag, in addition to the current line.

If a second tag is really intended to be placed that is identical to one already present in the file, pressing the '>' key a second time will override the default behavior and place an nth closing tag. It will then delete the extra chevron automatically.

Sets of tags still need to be entered one set per line for the script to behave as intended. Trying to do <tag1><tag2></tag2></tag1> is still beyond the scope of this script.


# Licensed under GNU GPL v3.0
