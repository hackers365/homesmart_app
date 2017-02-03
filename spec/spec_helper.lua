package.path = package.path .. ";/?.lua;/?/init.lua;/data/code/vanilla/framework/0_1_0_rc6/?.lua;/data/code/vanilla/framework/0_1_0_rc6/?/init.lua;;";
package.cpath = package.cpath .. ";/?.so;/data/code/vanilla/framework/0_1_0_rc6/?.so;;";

Registry={}
Registry['APP_ROOT'] = '/data/code/vanilla/app'
Registry['APP_NAME'] = 'app'

LoadV = function ( ... )
    return require(...)
end

LoadApp = function ( ... )
    return require(Registry['APP_ROOT'] .. '/' .. ...)
end

LoadV 'vanilla.spec.runner'
