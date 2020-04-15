package = "kong-headers2jwt"
version = "dev-1"
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
      ["kong.plugins.kong-headers2jwt.handler"] = "kong/plugins/kong-headers2jwt/handler.lua",
      ["kong.plugins.kong-headers2jwt.schema"] = "kong/plugins/kong-headers2jwt/schema.lua",
      ["kong.plugins.kong-headers2jwt.jwt"] = "kong/plugins/kong-headers2jwt/jwt.lua"
   }
}
