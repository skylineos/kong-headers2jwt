# kong-headers2jwt

**kong-headers2jwt** is a plugin that currently converts headers into a signed jwt.

## Install

1. Install `Lua` and `Luarocks`
    * @see - [https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-Unix](https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-Unix)
1. Clone the repository
    * `git clone https://github.com/skylineos/kong-headers2jwt.git`
1. Install locally
    * `luarocks install [path/to]/kong-headers2jwt/kong-headers2jwt-dev-1.rockspec`
    * Note that if you want this to be installed in the current directory, ensure that the `lua_modules` directory exists in the current directory

## Roadmap/Possible Future Featurs
  * Allow for any part of the request to be signed and added to JWT.
  * Allow for custom integrations to build on-top of other kong authentication plugins