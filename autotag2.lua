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
            if tag:find([[<[%w%d%s"'=]+/>]]) then
                goto breakout
            end
            local tagtoclose = tag:match("<([%a%d]+)")
            editor:AddText("</"..tagtoclose..">")
            editor:SetEmptySelection(curpos)
            ::breakout::
        end
    end

}