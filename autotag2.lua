return {
    name = "Autotag for xml",
    description = "Auto-enters closing tags for xml",
    author = "Brandon Wall @Solvaring",
    version = 0.1,
    onEditorCharAdded = function(self, editor, event)
        local tag = editor:GetCurLine()
        local curkey = event:GetKey()
        local curpos = editor:GetCurrentPos()
        if curkey == 62 and tag:find("%b<>") then
            if tag:find([[</]]) then
                goto breakout
            end
            if tag:find([[<[%w%d%s"'=]+/>]]) then
                goto breakout
            end
            local tagtoclose = tag:match("<([%a%d]+)")
            editor:AddText("</"..tagtoclose..">")
            ::breakout::
        end
    end

}