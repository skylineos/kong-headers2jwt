local _M = {
    DEBUG = "debug",
    ERR = "error",
    INFO = "info",
    HTTP_UNAUTHORIZED = 401,
    ctx = {},
    header = {},
    var = {request_uri = "/"},
    req = {
      get_uri_args = function(...) end,
      set_header = function(...) end,
      get_headers = function(...) end,
      clear_header = function(...) end
    },
    log = function(...)
      -- todo: change this to something else, 
      --   self.logs[#self.logs+1] = table.concat({...}, " ")
      -- print("ngx.log: ", table.concat({...}, " "))
    end,
    say = function(...) end,
    exit = function(...) end,
    redirect = function(...) end,
    config = {
      subsystem = "http"
    }
  }

  return _M