local AutoController = {}
local RmBridge = LoadApplication('models.service.rmbridge')

-- function IndexController:__construct()
-- -- self.parent:__construct()
--     print_r('===============IndexController:init===============')
-- -- --     -- self.aa = aa({info='ppppp'})
-- -- --     -- self.parent:__construct()
--     local get = self:getRequest():getParams()
--     self.d = '===============index===============' .. get.act
-- end

function AutoController:index()
    local Http = LoadLibrary('http'):new()
    local res, err = Http:get('http://www.xnw.com')
    if err then
        return err
    end
    return res.body
    --return 'hello vanillas.'
end

function AutoController:controlbyword()
    local Auto = LoadLibrary('auto')
    local get = self:getRequest():getParams()
    if not get.keyword then
        return 'keyword params error'
    end
    local ret = Auto:controlbyword(get.keyword)
    return ret
end

function AutoController:sendbyname()
    local get = self:getRequest():getParams()
    local data = RmBridge:sendByName(get.name)
    return data.msg
end

function AutoController:yeelight()
    local get = self:getRequest():getParams()
    if not get.location or not get.cmd then
        return 'error params'
    end
    local YeeLight = LoadApplication('models.service.yeelight')
    return YeeLight:send(get.location, get.cmd)
end

return AutoController
