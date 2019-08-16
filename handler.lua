-- © Kong 2018
local BasePlugin = require "kong.plugins.base_plugin"
local access = require "kong.plugins.kong-headers2jwt.access"

local KongHeaders2JwtHandler = BasePlugin:extend()

function KongHeaders2JwtHandler:new()
  KongHeaders2JwtHandler.super.new(self, "kong-headers2jwt")
end

function KongHeaders2JwtHandler:access(conf)
  KongHeaders2JwtHandler.super.access(self)
  access.execute(conf)
end

KongHeaders2JwtHandler.PRIORITY = 802 -- This plugin needs to be run as late as possible to be given opportunity to sign as much info as possible.
KongHeaders2JwtHandler.VERSION = "0.1.0"

return KongHeaders2JwtHandler
