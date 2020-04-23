package = "kong-headers2jwt"
version = "v0.2.3"
source = {
    url = "git://github.com/skylineos/kong-headers2jwt",
    branch = "master",
    dir = "kong-headers2jwt"
}
description = {
   homepage = "https://github.com/skylineos/kong-headers2jwt",
   license = "MIT"
}
dependencies = {
   "lua >= 5.3"
}
build = {
   type = "builtin",
   modules = {
      ["kong.plugins.kong-headers2jwt.handler"] = "handler.lua",
      ["kong.plugins.kong-headers2jwt.schema"] = "schema.lua",
      ["kong.plugins.kong-headers2jwt.jwt"] = "jwt.lua"
   }
}
