local tagtoclose
return {
    name = "Autotag for xml",
    description = "Auto-enters closing tags for xml",
    author = "Brandon Wall @Solvaring",
    version = 0.1,
    onEditorCharAdded = function(self, editor, event)  --On Character Added editor event handler [Event Handlers Listed Here](https://github.com/pkulchenko/ZeroBraneStudio/blob/master/packages/sample.lua)
        local tag = editor:GetCurLine() -- Retrieve text of the line containing caret, store in `tag`
        local curkey = event:GetKey() -- Get value of current key being pressed and assign to `curkey`
        if curkey == 62 and tag:find("%b<>") then -- If current key `curkey` is ">" and current line `tag` contains a balanced string resembling an html/xml tag
            local curpos = editor:GetCurrentPos() --Get Current position of caret and store in curpos
            for stag in tag:gmatch("<([%a%d]+)>") do -- Get the last opened tag on current line and store in `tagtoclose`
                tagtoclose = stag
            end
            if tagtoclose:find([[/>]]) then return end -- if the tag is self-closing then return
            local document = editor:GetText() -- Store all text currently in editor
            local fullclosingtag = "</"..tagtoclose..">" -- build closing tag
            local fullopeningtag = "<"..tagtoclose..">" -- build opening tag
            if document:find(fullopeningtag..">") then -- if opening tag with extra chevron found
                editor:AddText(fullclosingtag) -- add another closing tag
                editor:SetEmptySelection(curpos) -- reset caret
                editor:DeleteRange(curpos-1, 1) -- delete extra chevron ">"
                return
            elseif document:find(fullclosingtag) then -- If closing tag already found in document then return. The If part of this block above circumvents this behavior as a sort of override switch to enter an nth duplicate closing tag
                return
            end
            editor:AddText(fullclosingtag) -- add closing tag
            editor:SetEmptySelection(curpos) -- Reset cursor position so entries can begin to be made inbetween the opening and closing tag.
            ::breakout::
        end
    end

}