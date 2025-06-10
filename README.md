# Bachos UI Library
## An easy-to-use User Interface Library for Roblox!

#### This UI Library was made for Zen Hub, but you can use it too!
Interface based on **[Orion Library](https://github.com/jensonhirst/Orion/blob/main/Documentation.md)** that is *no longer supported*.

#### || <a href="https://bacho-development.github.io/bachos-ui">Documentation website (website being updated when there is an update in the changelog)</a> ||
#### || <a href="https://github.com/bacho-development/bachos-ui/blob/main/other/README.md">Changelog</a> ||

**Tested on: <a href="https://discord.gg/bunnilol">bunni.lol (Visual)</a>**
_________
# Initialization 

To load the library, use the code below:
```lua
getgenv().WindowParent = game.CoreGui
local Bacho = loadstring(game:HttpGet("https://raw.githubusercontent.com/bacho-development/bachos-ui/refs/heads/main/ui.lua")()
```

Or if you want to test it in Roblox Studio:
```lua
-- without the getgenv() --
local Bacho = loadstring(game:HttpGet("https://raw.githubusercontent.com/bacho-development/bachos-ui/refs/heads/main/ui.lua")()
```

> ### Note:
>
> The script for Roblox Studio should not be used in a normal game. The getgenv() part was made for testing purposes and will be removed one day or will change it's default values.

# Window - the core of the UI
To create a window, you need to do this:

```lua
-- bacho
local Window = Bacho:CreateWindow(WindowName)
```

# Tabs
To create a tab, you need to do this:

```lua
-- bacho, window
local Tab = Window:CreateTab(TabName, Icon)

--[[
TabName = The Tab's name. Tab's frame name is not the same as the TabName, it only assigns the text in the TabButton.
- Type: string

Icon = The Tab's icon. Same as TabName, it only assigns the image next to the TabButton.
- Type: string | number | nil
- Should be existing roblox decal or it won't load
]]
```

# Tab Elements
## Sections
> **UI doesn't support sections, currently.**
> 
> Will be available by calling Tab's CreateSection method
>
> **Also,** sections will have elements of the tab (excluding sections, of course)


## Labels
To create a label, you need to do this:

```lua
--bacho, window, tab
local Label = Tab:CreateLabel(Text)

--[[
Text = The label's text.
- Type: string
]]
```


## Buttons
To create a button, you need to do this:

```lua
--bacho, window, tab
local Button = Tab:CreateButton(Text, Callback)

--[[
Text = The button's text.
- Type: string

Callback = What should be called when the button is pressed.
- Type: function | nil
- Receives from the library: ()
- Default: function()
   print("Click!")
end
]]
```


## Toggle | Checkbox
To create a checkbox, you need to do this:

```lua
--bacho, window, tab
local Checkbox = Tab:CreateCheckbox(Text, Default, Callback)

--[[
Text = The checkbox text.
- Type: string

Default = The default checkbox state.
- Type: boolean | nil
- Default: false

Callback = What should be called when the checkbox was pressed.
- Type: function | nil
- Receives from the library: boolean (checkbox state)
- Default: function()
   print("Current state: <checkbox state>")
end
]]
```


## Colorpicker, Dropdown, Textbox, Slider, etc.

> **The library does not support these, currently.**
>
> The support will come soon as more updates will come out.


# Contact me:
### [My Discord server](https://discord.gg/aPeuZvnmus)
