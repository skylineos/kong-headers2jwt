-- todo: should this be somewhere else?
local JWT_PACKAGE = "kong.plugins.kong-headers2jwt.jwt"
package.loaded[JWT_PACKAGE] = nil
package.preload[JWT_PACKAGE] = function()
    return {
        build_jwt = function(...)
            return "jwt"
        end
    }
end

describe("kong-headers2jwt.rewrite", function()
    it("returns/responds with public key", function()
        assert.is_true(true)
    end)
end)

describe("kong-headers2jwt.access", function()

    -- system under test
    local sut = require("kong.plugins.kong-headers2jwt.access")
    local jwt
    local opts

    setup(function()
        jwt = package.loaded[JWT_PACKAGE]
    end)

    before_each(function()
        opts = require("fixture/config")
    end)

    describe("execute", function()
        it("clears and sets configured headers", function()
            -- arrange

            -- todo: can we reduce this setup here?
            local headers = {}
            headers["x-userinfo"] = "userinfo"
            headers["x-access-token"] = "token"
            headers["x-id-token"] = "id-token"
            headers["x-dont-touch"] = "special"

            local payload = {}
            payload["x-userinfo"] = "userinfo"
            payload["x-access-token"] = "token"
            payload["x-id-token"] = "id-token"

            
            ngx.req.get_headers = function()
                return headers
            end
            
            local cleared_headers = {}
            ngx.req.clear_header = function(header)
                cleared_headers[header] = true
            end
            
            local build_jwt_spy = spy.on(jwt, "build_jwt")

            local ngx_req_set_header = spy.new(function(header, payload) end)
            ngx.req.set_header = ngx_req_set_header

            -- act
            sut.execute(opts)

            -- assert

            -- verify headers were removed
            assert.is_true(cleared_headers["x-userinfo"])
            assert.is_true(cleared_headers["x-access-token"])
            assert.is_falsy(cleared_headers["x-dont-touch"])
            
            -- verify a jwt was built with proper arguments
            assert.spy(build_jwt_spy).was_called_with(match.is_ref(opts), payload)

            -- verify header was set
            assert.spy(ngx_req_set_header).was_called_with(opts.header, match.is_equal("jwt"))
        end)
    end)
end)