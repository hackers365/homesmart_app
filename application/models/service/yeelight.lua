local YeelightService = {}

local json = require 'cjson'
local ngx_encode_args = ngx.encode_args

local function _sendRequest(ip, port, data)
    local sock = ngx.socket.tcp()
    sock:settimeout(2000)
    local ok, err = sock:connect(ip, port)
    if not ok then
        return {
            code = 1,
            msg = '连接失败.',
        }
    end
    local bytes,err = sock:send(data .. "\r\n")
    if not bytes then
        return {
            code = 2,
            msg = '发送失败.',
        }
    end
    local line, err, partial = sock:receive()
    if not line then
        return {
            code = 3,
            msg = err
        }
    end
    sock:setkeepalive(30000, 10)
    return {code= 0, msg = 'ok'}
end

--通过code来进行发送
function YeelightService:send(conf)
    return _sendRequest(conf.ip, conf.port, json.encode(conf.data))
end

return YeelightService
