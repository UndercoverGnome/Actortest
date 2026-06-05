# Actortest

## DESIGN/INSPIRATIONS
A Godot game which ideally would end up a life sim like the Sims (simulated ai, etc) crossed with the interactivity of project zomboid, crossed with a setting like GTA, with the combat of Arma/dcs. Realistic everything, where I can add stuff depending on what I'm interested in at that time (ie engine sim, helicopter dynamics, speed of sound, economies, police force, law, emotions, medical systems, romance, search and rescue, job simulation, crime etc.) I think I'll make the graphics low-poly, with low resolution textures, A. because I think it looks cool, and B. because it will be both quicker to run and quicker to develop.

## GOAL-ORIENTED AI/PATHFINDING
I want AI to decide what to do based on it's goals. It will first worry about saving it's life, then it's relationships, then it's job etc based on what it thinks is important. It will have long term and short term goals.
Needs → Motivators → Goals → Actions
It also needs different modes ie combat, work, relationship, survival etc (adrenaline?? psychology???)

I want pathfinding to be based on what it can see around it so that it is quicker and more adaptable than navmesh or A* (Haven't done any testing though, just ideas). I haven't quite decided how to make it so that it "knows" a location like it's town, without becoming robotic. Maybe they develop mental paths or something.
I also want to develop an algorithmic text-to-speech system if my research proves it’s possible. Ideally it could handle pitch of voice, age, whisper-shout, emotion, etc.

## SIMULATION LEVELS
I think I will make it have two or three levels of simulation:
Close: everything simulated full fidelity. Limited to <1km, so as to not blow up the system.
Medium: Simulate people as points without collision - ie they are in room a of building x. Simplified movement and desision making. Cars are now points a percent along a road. <3km maybe
Far: Simulate towns as input/output, roads as flows rather than simulating cars individually.
If necessary, I can simulate from multiple points IE player, and important story character with smaller radiuses. (ie enemy officer or something)

## SCENARIOS
I want the game to be a simulation base for people to build their own experiences. A scenario is a package containing settings, rules, a starting setup, a map (or a reference to a map) and (optionally) goals.
There may be short or long scenarios. Some short scale ones could be to do a bombing run as a fighter pilot, or to save a hostage. Long scale could be to win the city athletic competition or overthrow the island in an uprising.
For example, the fighter pilot scenario will start on the airport Tbilisi map, as a pilot with a f-16 (or whatever would be correct) and a set of instructions outlining the goal (bomb suspected enemy hideout at coords -41.8E, 12.3N.
