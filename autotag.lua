return {
    name = "Autotag for xml",
    description = "Auto-enters closing tags for xml",
    author = "Brandon Wall @Solvaring",
    version = 0.1,
    onEditorCharAdded = function(self, editor, event)
        local tag = editor:GetCurLine()
        if tag:find('%b<>') then
            local position = editor:GetCurrentPos()
            if tag:find('/>') then
                goto breakout
            end
            if tag:find('</') then
                goto breakout
            end
            tag = tag:match('<([%w]+)[%s]*')
            if string.find(editor:GetCurLine(), '%b<><') then
                editor:AddText("/"..tag..">")
                editor:GotoPos(position-1)
                goto breakout
            end
            editor:AddText("</"..tag..">")
            editor:GotoPos(position)
            ::breakout::
        end
    end
}