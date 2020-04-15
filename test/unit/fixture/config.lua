local _M = {
    issuer = "kong",
    public_key_location = "/usr/local/kong/keys/cert.crt",
    private_key_location ="/usr/local/kong/keys/key.key",
    public_key_uri = "/kong/public/public.crt",
    include_credential_type = true,
    header = "authorization",
    headers = {
        "x-userinfo",
        "x-access-token",
        "x-id-token"
    }
}

return _M