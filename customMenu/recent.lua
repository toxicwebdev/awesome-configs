local setmetatable = setmetatable
local io = io
local ipairs = ipairs
local table = table
local loadstring = loadstring
local button = require("awful.button")
local beautiful = require("beautiful")
local widget2 = require("awful.widget")
local naughty = require("naughty")
local vicious = require("vicious")
local tag = require("awful.tag")
local print = print
local util = require("awful.util")
local shifty = require("shifty")
local menu = require("awful.menu")
local capi = { image = image,
               screen = screen,
               widget = widget,
               mouse = mouse,
	       tag = tag}

module("customMenu.recent")

local data = {}

function update()

end

function new(screen, args) 
  local aFile = io.popen(util.getdir("config") .. "/Scripts/awesomeTopExec.sh")
  local count = 0
  local commandArray = {}
  while true do
      local line = aFile:read("*line")
      if line == nil then break end
      commandArray[count] = {line,line}
      count = count + 1
  end
  aFile:close()
  mymainmenu3 = menu.new({ items = commandArray})


  mylauncher3text = capi.widget({ type = "textbox" })
  mylauncher3text.text = "       Recent |"
  mylauncher3text.bg_image = capi.image(util.getdir("config") .. "/Icon/tags/star2.png")
  mylauncher3text.bg_align = "left"
  mylauncher3text.bg_resize = true
  
  mylauncher3text:buttons( util.table.join(
    button({ }, 1, function()
      mymainmenu3:toggle()
  end)
  ))
  
  return mylauncher3text
end


setmetatable(_M, { __call = function(_, ...) return new(...) end })