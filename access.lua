local _M = {}
local jwt = require "kong.plugins.kong-headers2jwt.jwt"

function _M.execute(conf)
    ngx.log(ngx.INFO, "access:execute(conf) starting")
    local payload = {}
    -- loop through headers and grab the ones configured
    local headers = ngx.req.get_headers()
    for index, header in ipairs(conf.headers) do
        ngx.log(ngx.INFO, "Header key:", header)
        ngx.log(ngx.INFO, "Header value:", headers[header])
        payload[header] = headers[header]

        -- clear the headers grabbed as they aren't necessary anymore
        ngx.req.clear_header(header)
    end
    -- set a new jwt header that encompasses all information grabbed
    ngx.req.set_header(conf.header, jwt.build_jwt(conf, payload))
end

return _M