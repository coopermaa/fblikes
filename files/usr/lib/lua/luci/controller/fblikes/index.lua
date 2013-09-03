-- Save this to /usr/lib/lua/luci/controller/fblikes/index.lua
-- Browse to: /cgi-bin/luci/fblikes

module("luci.controller.fblikes.index", package.seeall)

function index()
  -- 定義節點, request 時會呼叫 model/cbi/fblikes/fblikes.lua
  page = entry({"fblikes"}, cbi("fblikes/fblikes"))
  page.dependent = false
  
  -- 必須以 root 身分登入
  page.sysauth = "root"
  page.sysauth_authenticator = "htmlauth"    
  
  -- 定義節點, request 時會呼叫 action_logout 函式
  entry({"fblikes", "logout"}, call("action_logout"), "Logout")
end

function action_logout()
  local dsp = require "luci.dispatcher"
  local sauth = require "luci.sauth"
  if dsp.context.authsession then
  	sauth.kill(dsp.context.authsession)
  	dsp.context.urltoken.stok = nil
  end
  
  luci.http.header("Set-Cookie", "sysauth=; path=" .. dsp.build_url())
  -- redirect to /cgi-bin/luci/fblikes
  luci.http.redirect(luci.dispatcher.build_url() .. "/fblikes")
end
 