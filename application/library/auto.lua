local Auto = Class("auto")

local config = LoadApp('config.auto_conf')
local json = require 'cjson'

local function _split(str, delimiter)
    if str==nil or str=='' or delimiter==nil then
        return nil
    end

    local result = {}
    for match in (str..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match)
    end
    return result
end

local function _getinfo(cmd_list, keyword_list)
    local cmd
    for k,v in pairs(keyword_list) do
        if cmd_list[v] then
            cmd = cmd_list[v]
            break
        end
    end
    return cmd
end

local function _concat(tab1, tab2)
    for k,v in pairs(tab2) do
        tab1[k] = v
    end
    return tab1
end

local function _getcmdinfo(keyword_list)
    local action = _getinfo(config['cmd']['action'], keyword_list)
    local device = _getinfo(config['cmd']['device'], keyword_list)
    local location = _getinfo(config['cmd']['location'], keyword_list)
    return action,device,location
end

local function _controlYeelight(conf)
    local Yeelight = LoadApplication('models.service.yeelight')
    local ret
    for i,v in ipairs(conf.list) do
        local data = {
            data = conf.data,
            ip = v.ip,
            port = v.port
        }
        ret = Yeelight:send(data)   
    end
    return ret
end

local function _controlRmBridge(conf)
    local RmBridge = LoadApplication('models.service.rmbridge')
    return RmBridge:sendByCode(conf)
end

function Auto:controlbyword(keyword)
    local keyword_list = _split(keyword, ',')
    local action,device,location = _getcmdinfo(keyword_list)
    local conf = {}
    local device_conf
    local ret
    if action and device then
        local device_key = ''
        if location then
            device_key = location .. '_' .. device
        end
        if config["device"][device_key] then
            device_conf = config["device"][device_key]
        else
            device_conf = config["device"]["rm_bridge"]
        end
        conf = device_conf
        if location and device and action and config["data"][location][device][action] then
            conf["data"] = config["data"][location][device][action]
        elseif device and action and config["data"][device][action] then
            conf["data"] = config["data"][device][action]
        else
            return false
        end

        if device_conf['type'] == 'yeelight' then
            ret = _controlYeelight(conf)
        elseif device_conf['type'] == 'rm_bridge' then
            ret = _controlRmBridge(conf)
        end
        return json.encode(ret)
    end
    return json.encode({code = 1, msg = '没有找到相应设备.'})
end

function Auto:__construct( data )

end


return Auto
