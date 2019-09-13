return {
  fields = {
    issuer = { type = "string", required = false },
    private_key_location = { type = "string", required = false },
    public_key_location = { type = "string", required = false },
    public_key_uri = { type = "string", required = true },
    key_id = { type = "string", required = false},
    header = { type = "string", default = "JWT"},
    jwt_private_property_name = { type = "string", default = "private" },
    include_credential_type = { type = "boolean", default = false},
    headers = { type = "array", default = {}}
  }
}