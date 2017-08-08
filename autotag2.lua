return {
    name = "Autotag for xml",
    description = "Auto-enters closing tags for xml",
    author = "Brandon Wall @Solvaring",
    version = 0.1,
    onEditorCharAdded = function(self, editor, event)
        local tag = editor:GetCurLine()
        local curkey = event:GetKey()
        if curkey == 62 and tag:find("%b<>") then
        local curpos = editor:GetCurrentPos()
            if tag:find([[</]]) then
                goto breakout
            end
            if tag:find([[/>]]) then
                return
            end
            local document = editor:GetText()
            local tagtoclose = tag:match("<([%a%d]+)")
            local fullclosingtag = "</"..tagtoclose..">"
            local fullopeningtag = "<"..tagtoclose..">"
            if document:find(fullopeningtag..">") then
                editor:AddText(fullclosingtag)
                editor:SetEmptySelection(curpos)
                editor:DeleteRange(curpos-1, 1)
                return
            elseif document:find(fullclosingtag) then
                return
            end
            editor:AddText("</"..tagtoclose..">")
            editor:SetEmptySelection(curpos)
            ::breakout::
        end
    end

}