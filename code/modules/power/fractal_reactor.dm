// ###############################################################################
// # ITEM: FRACTAL ENERGY REACTOR                                                #
// # FUNCTION: Generate infinite electricity. Used for map testing.              #
// ###############################################################################

/obj/machinery/power/fractal_reactor
	name = "Fractal Energy Reactor"
	desc = "This thing drains power from fractal-subspace."
	icon = 'icons/obj/power.dmi'
	icon_state = "tracker" //ICON stolen from solar tracker. There is no need to make new texture for debug item
	anchored = 1
	density = 1
	var/power_generation_rate = 2000000 //Defaults to 2MW of power. Should be enough to run SMES charging on full 2 times.
	var/powernet_connection_failed = 0


/obj/machinery/power/fractal_reactor/power_change()
	return

/obj/machinery/power/fractal_reactor/process()
	if(!powernet && !powernet_connection_failed)
		if(!connect_to_network())
			powernet_connection_failed = 1
			spawn(150) // Error! Check again in 15 seconds.
				powernet_connection_failed = 0
	add_avail(power_generation_rate)
