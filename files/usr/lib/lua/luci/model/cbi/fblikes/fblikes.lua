-- Save this to /usr/lib/lua/luci/model/cbi/fblikes/fblikes.lua
local fs = require "nixio.fs"
m = nil

if fs.access("/etc/config/fblikes") then  
  m = Map("fblikes", "Facebook Likes LED Display", 
            "Configure the basic aspects of Facebook Likes LED Display.") 
                       
  s = m:section(NamedSection, "main", translate("Main Settings"))
  source_url = s:option(Value, "source_url", translate("Facebook URL"))
  
  function source_url.write(self, section, value)
    m.uci:set("fblikes", section, self.option, value)
	-- os.execute("/etc/init.d/fblikes restart >/dev/null") -- not work! why?
    os.execute("/etc/init.d/fblikes stop >/dev/null")
    os.execute("/etc/init.d/fblikes start >/dev/null")
  end
    
  o = s:option(Value, "refresh_interval", translate("Refresh Interval"))  
  o.write = source_url.write
  o = s:option(Value, "serialport", translate("Serial Port"))
  o.write = source_url.write
    
  local bauds = {9600, 19200, 28800, 38400, 57600, 115200}  
  o = s:option(ListValue, "baud_rate", translate("Baud Rate"))
  for i = 1,#bauds do o:value(bauds[i]) end 
  o.write = source_url.write
  
  -- Note: o.write is called only when options's value is changed
end

return m