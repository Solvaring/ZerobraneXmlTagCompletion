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
            --local attcheck
            local check1=""
            local dubcheck=""
            for stag, check in tag:gmatch("<(%w+)%s*[%s%w\"\'_=]*(/*)>") do -- Get the last opened tag on current line and store in `tagtoclose`
                check1 = check
                tagtoclose = stag
                --[[for attrcheck in tag:gmatch("[\"\'].+>") do
                    attcheck = attrcheck
                end]]
            end
            --if attcheck then attcheck=nil return end
            if check1:find("/") then return end -- if the tag is self-closing then return
            local document = editor:GetText() -- Store all text currently in editor
            if not tagtoclose then return end
            local fullclosingtag = "</"..tagtoclose..">" -- build closing tag
            local fullopeningtag = "<"..tagtoclose..">" -- build opening tag
            local partialopeningtag = "<"..tagtoclose
            if document:find(fullclosingtag) then
                for dubchev in tag:gmatch(">>") do dubcheck = dubchev end
                if dubcheck:find(">>") then
                    editor:AddText(fullclosingtag) -- add another closing tag
                    editor:SetEmptySelection(curpos) -- reset caret
                    editor:DeleteRange(curpos-1, 1) -- delete extra chevron ">
                    fullclosingtag=nil
                    fullopeningtag=nil
                    tagtoclose=nil
                    return
                else
                    return
                end
            end
            editor:AddText(fullclosingtag) -- add closing tag
            editor:SetEmptySelection(curpos) -- Reset cursor position so entries can begin to be made inbetween the opening and closing tag.
            fullclosingtag = nil
            fullopeningtag=nil
            tagtoclose=nil
        end
    end

}