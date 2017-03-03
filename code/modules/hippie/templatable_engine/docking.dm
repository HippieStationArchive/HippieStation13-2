/obj/docking_port/mobile/engine
	name = "engine system"
	id = "engine"

	dir = SOUTH
	port_angle = 180
	width = 24
	dwidth = 12
	height = 23
	roundstart_move = "engine_away"

//special poddoors that open when engine shuttle docks
/obj/machinery/door/poddoor/enginedock
	var/checkdir = 4	//door won't open if turf in this dir is `turftype`
	var/turftype = /turf/open/space

/obj/machinery/door/poddoor/enginedock/proc/check()
	var/turf/T = get_step(src, checkdir)
	if(!istype(T, turftype))
		INVOKE_ASYNC(src, .proc/open)
	else
		INVOKE_ASYNC(src, .proc/close)

/area/shuttle/engine
	name = "Engine Shuttle"

/obj/machinery/computer/shuttle/engine
	name = "Engine test console"
	shuttleId = "engine"
	possible_destinations = "engine_home;engine_away"