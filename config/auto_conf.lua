local auto_conf = {}

--location
auto_conf.cmd = {
    location = {
        living = 'living',
        客厅 = 'living',
        bedroom = 'bedroom',
        卧室 = 'bedroom',
        rest = 'rest',
        餐厅 = 'rest',
        kitchen = 'kitchen',
        厨房 = 'kitchen',
    },
    --device
    device = {
        灯 = 'light',
        light = 'light',
        空调 = 'aircondi',
        热水器 = 'heater',
        heater = 'heater',
        电视 = 'tv',
        tv = 'tv',
        天猫 = 'tianmao',
        tianmao = 'tianmao',
        华为 = 'huawei',
        huawei = 'huawei',
    },
    --action
    action = {
        open = 'open',
        打开 = 'open',
        开开 = 'open',
        close = 'close',
        关掉 = 'close',
        关闭 = 'close',
        关了 = 'close',
        next = 'next',
        下一个 = 'right',
        prev = 'prev',
        上一个 = 'left',
        音量大 = 'volume_up',
        volume_up = 'volume_up',
        音量小 = 'volume_down',
        volume_down = 'volume_down',
        首页 = 'index',
        向左 = 'left',
        左边 = 'left',
        left = 'left',
        向右 = 'right',
        右边 = 'right',
        right = 'right',
    }
}

auto_conf.device = {
    bedroom_light = {
        type = 'yeelight',
        list = {
            {ip = '192.168.101.50', port = 55443}
        }
    },
    rest_light = {
        type = 'yeelight',
        list = {
            {ip = '192.168.101.51', port = 55443},
            {ip = '192.168.101.52', port = 55443}
        }
    },
    rm_bridge = {
        type = 'rm_bridge',
        ip = '192.168.100.180',
        port = 7474,
        mac = 'b4:43:0d:ee:fc:91'
    }
}


--data
auto_conf.data = {
    bedroom = {
        light = {
            open = {
                id = 1,
                method = "set_power",
                params = {"on", "smooth", 500}
            },
            close = {
                id = 1,
                method = "set_power",
                params = {"off", "smooth", 500}
            }
        }
    },
    rest = {
        light = {
            open = {
                id = 1,
                method = "set_power",
                params = {"on", "smooth", 500}
            },
            close = {
                id = 1,
                method = "set_power",
                params = {"off", "smooth", 500}
            }
        }
    },
    living = {
        light = {
            open = 'b20934000f260f260f250f260f250e260f25260e260f0f250f260f250f26260f260f0f26260f0f26260f0f250f250f250f26250f0f00016700000000',
            close = 'b20934000f250f260f260e260f250e260e26250e260f0e250e260f250f25260f250f0e25260e0f26250e0f250f250f26260f0f260e00016700000000',
        }
    },
    kitchen = {
        light = {
            open = 'b20934000f260f260e260e260e260e260e260f260f260e26250f0e260e26250f250f260f0f260e260e26260f0e260e26250f250f0e00016700000000',
            close = 'b20008020f260d250e250d260d260d250e250d260d250d26240f0d250d26240f240e250e0d260d250e25240f0d26240e0d260d250e0001670d260d260d260d260d260d260d260e250d260d25250e0d250e25240f240f240e0d260d250e25240f0d26240f0d260d260e0001660e250d260d260d260d260d250e260d260d260d26240e0e250e25250e250f240f0d250e250e25250e0d26250e0e250e250e0001660e250e250e260d260d250e250e250d260e250e25240f0e250d26240f240f250e0d260d260e25240f0d26240f0d260d260d0001670d260d260d260d260d260d250e260d260d250e26240f0d260d26240f240e250e0e250d260d26240f0d26240f0d260e250d0001670e250d260e250d260d260e250d260d260d260d26240f0d260d26240f240e250e0e250e250e25250e0d26240f0d260d260d0001670d260e250d260d260d260d260d260d260d250e25250e0ead0e25250e240f240e0e250d260d25250e0d25250f0d250d260d0001670d260d250d260d260d260d260d260d260d260d26240f0d270c26240f240f240f0d260d260d26240f0d26240f0d260e250d0001680d260d260d260d260d260d260d260e250e250d26250e0e250e25250e250f240e0d260e250e26240f0d25250e0e250e260d0001670e260d250e250e250e270d260d260d260d260d26240f0d260d26240f240f240f0d260d260e25240f0e25240f0e250d260e0005dc',
        }
    },
    heater = {
        open = 'b209320006110611061105120611110706110611061110070611100606121006061111060611110606111107061106111106100606a7000000000000',
        close = 'b100480111051104070f061006a6070f0610040410060f060f12050510070f060f110506101105060f050d040610110504040e0a040404040406101105100511050610061006a705100610060f070f06101104070f0610060f110506101105060f1105040404100d0405060f110506101104120510050610061006a60610060f070f0610060f1105061006100510120406101104070f1105061011040610110506101104120412040610051006a70610061005100610060f1105060f070f06101105060f1105070f1105060f120406101104070f110511051105060f061006a7060f070f060f070f06101105060f061006101104070f110506101104070f110407101104070f1105100610050610061006a6070f060f06100610061010050610060f070f110506101104070f110506101105060f110506101005070408051105060f0710040404ba040005dc',
    },
    tianmao = {
        open = '260050000001299512131312131312131312131312131312133713381238123812381312131312381238133713371313123812131337131312131312131312381213133713131238120005690001284a13000d050000000000000000',
        close = '260050000001299512131312131312131312131312131312133713381238123812381312131312381238133713371313123812131337131312131312131312381213133713131238120005690001284a13000d050000000000000000',
        volume_up = '26004800000128951213131312131213131213131213131213371338123812381238121313131238123812381238133713371337133713381213121313131213121313121313121313000d05',
        volume_down = '260050000001289512131312131312131312131312131312133713371338123812381213131213381238121313371337133713131238121313121337131312131312133713131238120005690001284a13000d050000000000000000',
        index = '26004800000128951213131213131213131213131213121313371337133713381238121313121337133812381238131213131213133713121313121313121337133713381213133713000d05',
        back = '2600500000012a9313121411151113121510141214111510143614361437143613371411151015351437133714361535141114121337141115101412141114111535143713121436140005660001284b13000d050000000000000000',
        ok = '26004800000129951213121313131213121313121313121313371337133812381238121313121338121313371312131312131312131312131337131213381238123813371337133713000d05',
        right = '26004800000128951312131312131312131312131312131312381238123813371337131312131337131213371338123812131312131312131337131213131213133713371337133812000d05',
        left = '260050000001289512131312131312131312131312131312133713371338123812381213131312381213133713371313121313121313121313371312131312381238133713371337130005680001284a13000d050000000000000000',
        down = '26004800000129941313131214111313131214111313121314361436133714371238131214111436141214361411143613131312141114121337131214361412123813371436123814000d05',
        up = '26004800000128951312131312131312131312131312131312381238133713371337131312131337133713381213121313121313123813121313121313371337133713371313123813000d05',
    }
}

return auto_conf