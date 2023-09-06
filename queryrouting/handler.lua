-- handler.lua for queryrouting
-- Import modules
local kong = kong

-- Define plugin
local queryrouting = {}

-- Define Priority
queryrouting.PRIORITY = 1000
queryrouting.VERSION = "1.0"

-- Define the function
function queryrouting:access(conf)
  local customparam = conf.param
  local customvalue = conf.value
  local customservice = conf.service
  local sys_param = kong.request.get_query_arg(customparam)
  ngx.log(ngx.INFO, "Custom plugin - attemting to use param=", conf.param)
  ngx.log(ngx.INFO, "Custom plugin - param value=", conf.value)
  -- match statement
  if sys_param == customvalue then
   -- set the target svc
    kong.service.set_upstream(customservice)
  end
end
return queryrouting
