-- TransXacto Networks - Keyboard Brightness Control
-- Enterprise-grade keyboard backlight automation for macOS
-- https://transxacto.net

-- Create menu bar item with TransXacto branding
menubar = hs.menubar.new()

function setKeyboardBright(level)
    -- Open keyboard settings
    hs.osascript.applescript([[
        tell application "System Settings"
            reveal pane id "com.apple.Keyboard-Settings.extension"
        end tell
    ]])
    
    hs.timer.doAfter(1, function()
        local systemSettings = hs.application.find("System Settings")
        if not systemSettings then return end
        
        local ax = hs.axuielement.applicationElement(systemSettings)
        
        -- Find all buttons in the UI
        local function findAllButtons(element, depth, buttons)
            buttons = buttons or {}
            if depth > 20 then return buttons end
            
            local role = element:attributeValue("AXRole")
            
            if role == "AXButton" then
                local desc = element:attributeValue("AXDescription")
                if desc == "Reduce Brightness" then
                    buttons.reduce = element
                elseif desc == "Increase Brightness" then
                    buttons.increase = element
                end
            end
            
            local children = element:attributeValue("AXChildren")
            if children then
                for _, child in ipairs(children) do
                    findAllButtons(child, depth + 1, buttons)
                end
            end
            
            return buttons
        end
        
        -- Find both buttons
        local buttons = findAllButtons(ax, 0)
        
        if not buttons.reduce or not buttons.increase then
            hs.alert.show("TransXacto: Could not find brightness controls")
            return
        end
        
        -- First, click reduce button 20 times to zero it out
        for i = 1, 20 do
            buttons.reduce:performAction("AXPress")
            hs.timer.usleep(50000) -- 50ms delay
        end
        
        -- Then click increase button the right number of times
        local clicks = math.floor(level * 16) -- Assuming 16 levels
        for i = 1, clicks do
            buttons.increase:performAction("AXPress")
            hs.timer.usleep(50000)
        end
        
        hs.alert.show(string.format("TransXacto: Keyboard brightness set to %.0f%%", level * 100))
        
        -- Close System Settings
        hs.timer.doAfter(0.5, function()
            systemSettings:kill()
        end)
    end)
    
    -- Update menu icon
    if level == 0 then
        menubar:setTitle("🌙")
    elseif level <= 0.5 then
        menubar:setTitle("💡")
    else
        menubar:setTitle("☀️")
    end
end

-- Initialize with default icon
menubar:setTitle("💡")

-- Create menu with TransXacto branding
menubar:setMenu({
    { title = "TransXacto Keyboard Control", disabled = true },
    { title = "-" },
    { title = "💡 Keyboard Off", fn = function() setKeyboardBright(0) end },
    { title = "💡 Keyboard 50%", fn = function() setKeyboardBright(0.5) end },
    { title = "☀️ Keyboard 100%", fn = function() setKeyboardBright(1.0) end },
    { title = "-" },
    { title = "About TransXacto Networks", fn = function() 
        hs.execute("open https://transxacto.net")
    end }
})

-- Show welcome notification
hs.notify.new({
    title = "TransXacto Keyboard Control",
    informativeText = "Enterprise keyboard brightness automation is now active",
    withdrawAfter = 3
}):send()
