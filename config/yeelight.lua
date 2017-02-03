local yeelight = {}

yeelight.room = {
	ip = '192.168.101.50',
	port = 55443,
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

yeelight.dining = {
	ip = '192.168.101.51',
	port = 55443,
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

--~ yeelight.dining.info = {
	--~ ip = '192.168.100.180',
	--~ port = 7474,
	--~ open = {"on", "smooth", 500},
	--~ close = {"off", "smooth", 500}
--~ }


return yeelight
