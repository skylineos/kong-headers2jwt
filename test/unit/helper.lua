package.path = package.path .. ";/usr/local/kong-headers2jwt/test/unit/?.lua;;" -- kong & co

-- todo: can we move this to a better place?
ngx = require("mock.ngx")
_G.ngx = ngx