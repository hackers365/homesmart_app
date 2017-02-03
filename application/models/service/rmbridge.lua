local RmBridgeService = {}

local config = LoadApp('config.rmbridge')
local Http = LoadLibrary('http'):new()
local json = require 'cjson'
local ngx_encode_args = ngx.encode_args

local function _sendRequest(method, url, data)
    local headers = {}
    local res, err
    method = string.lower(method)

    headers['Content-Type'] = 'application/json'
    headers['Connection'] = 'keep-alive'
    if method == 'get' then
        url = url .. '?' .. ngx_encode_args(data)
        res, err = Http:get(url, nil, headers, 10000)
    else
        res, err = Http:post(url, data, headers, 10000)
    end
    if err then
        local ret = {
            code = 1,
            msg = err,
        }
        return ret
    end
    return json.decode(res.body)
end

function RmBridgeService:get(name)

end

function RmBridgeService:set(name, code)

end

--这里的名称是rm bridge里的name,通过name查找到code然后调用sendByCode
function RmBridgeService:sendByName(name)
    local code = config.data[name]
    if code ~= nil then
        return self:sendByCode(code)
    end
    return false
end

--通过code来进行发送
function RmBridgeService:sendByCode(conf)
    local data = {
        api_id = 1004,
        command = "send_code",
        mac = conf.mac,
        data = conf.data
    }
    --url = 'http://' .. config.info.ip .. ':' .. config.info.port .. url
    local url = 'http://' .. conf.ip .. ':' .. conf.port .. '/'
    local ret = _sendRequest('POST', url, json.encode(data))
    return ret
end



return RmBridgeService
