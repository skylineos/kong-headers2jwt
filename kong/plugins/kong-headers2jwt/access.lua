local _M = {}
local jwt = require("kong.plugins.kong-headers2jwt.jwt")
local pl_file = require "pl.file"


function _M.rewrite(conf)
    ngx.log(ngx.INFO, "")
    if (ngx.var.uri == conf.public_key_uri) then
        ngx.log(ngx.INFO, "Public Key route hit, will serve key.")
        
        -- get key file location
        local public_key_file_location = os.getenv("KONG_SSL_CERT_DER")
        if public_key_file_location == nil then
            public_key_file_location =  conf.public_key_location
        end

        -- get key content
        local key_content, err = pl_file.read(public_key_file_location)
        if not key_content then
            ngx.log(ngx.ERR, "Could not read file contents", err)
            return nil, err
        end

        -- serve content
        ngx.header.content_type = "text/plain"
        ngx.say(key_content)

        return ngx.exit(ngx.HTTP_OK)
    end
end

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