return {
  name = "queryrouting",
  fields = {
    { config = {
        type = "record",
        fields = {
          { service = { type = "string", default = "nginx-service.default.80.svc", }, },
          { param = { type = "string", default = "sys", }, },
          { value = { type = "string", default = "test", }, },
        },
    }, },
  }
}
