ARG KONG_BASE_TAG
FROM kong:${KONG_BASE_TAG}


ENV LUA_PATH /usr/local/share/lua/5.1/?.lua;/usr/local/kong-headers2jwt/?.lua
# For lua-cjson
ENV LUA_CPATH /usr/local/lib/lua/5.1/?.so

# Install unzip for luarocks, gcc for lua-cjson
RUN apk update && \
    apk add unzip gcc libc-dev bash
 
RUN luarocks install luacov
RUN luarocks install luaunit
RUN luarocks install lua-cjson
RUN luarocks install lua-resty-jwt
RUN luarocks install lua-resty-string

RUN luarocks install busted

WORKDIR /usr/local/kong-headers2jwt

COPY . .