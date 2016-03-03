# Written in Python v2.7.9 by DRGN of SmashBoards (Daniel R. Cappel).
# Version 2.0
# Find the official thread here for usage and other documentation: 
# http://smashboards.com/threads/melee-code-manager-easily-add-codes-to-your-game.416437/

# These are hex ranges that indicate safe areas for custom code. The regions in this first list are the same between all  
# game versions, hence the name, "common" Code regions. Between each set of parenthesis, you have the start
# of a region, followed by the end of that region. If you would like the program to ignore one of these regions,
# then you may erase it from this list. (However, I recommend making a copy of the line first, in case you make a mistake or
# would like to undo it later. Then, just comment out the backup line by preceding it with a '#'.)
#
# Remember that each entry needs to be followed by a comma, except for the last one.
#
# If you'd like to remove all of these regions, you still need to preserve the variable here. Just make it equal to an empty 
# pair of brackets, i.e. "commonCodeRegions = []"
#
# You may also add regions. Just be sure that you know what you're doing and have tested it, and that no regions overlap with one another!

commonCodeRegions = [ ( 0x2C8, 0x398 ), ( 0x39C, 0x498 ), ( 0x4E4, 0x598 ),	( 0x5CC, 0x698 ),			# 0xD0, 0xFC, 0xB4, 0xCC 	= 0x34C
					  ( 0x6CC, 0x798 ), ( 0x8CC, 0x998 ), ( 0x99C, 0xA98 ), ( 0xACC, 0xB98 ),			# 0xCC, 0xCC, 0xFC, 0xCC 	= 0x360
					  ( 0xBCC, 0xE98 ), ( 0xECC, 0xF98 ), ( 0xFCC, 0x1098 ), (0x10CC, 0x1198 ),			# 0x2CC, 0xCC, 0xCC, 0xCC 	= 0x530		+(119C, 11B8) 0x0C?
					  ( 0x1220, 0x1298 ), ( 0x1308, 0x1398 ), ( 0x1408, 0x1498 ), ( 0x1508, 0x1598 ),	# 0x78, 0x90, 0x90, 0x90 	= 0x228
					  ( 0x15CC, 0x1698 ), ( 0x16CC, 0x1898 ), ( 0x18CC, 0x1998 ), ( 0x19CC, 0x1E98 ),	# 0xCC, 0x1CC, 0xCC, 0x4CC 	= 0x830
					  ( 0x1ECC, 0x1F98 ), ( 0x1FCC, 0x2098 ), ( 0x20CC, 0x2198 ) ]						# 0xCC, 0xCC, 0xCC 			= 0x264
																											 # Total space of above: 0x1898

# The regions below are used for the game's Debug Menu, which some users may not want to overwrite (hence the toggle option 
# already available in the program. Use that if you'd like to ignore this area).

v102DebugModeRegion = (0x3f7124, 0x3fac20) # Total space: 0x3AFC (same for all game versions)
v101DebugModeRegion = (0x3f6444, 0x3f9f40)
v100DebugModeRegion = (0x3f5294, 0x3f8d90)
vPALDebugModeRegion = (0x3f7ecc, 0x3fbae8)	


# The original purpose of the first 5 regions below (per game version) is for the unused 'USB Screenshot' function, described here:
# http://smashboards.com/threads/the-dol-mod-topic.326347/page-11#post-19130116
# 
# If they are used, then the following changes need to be made: 0x1a1b64 --> 60000000, 0x1a1c50 --> 60000000 (nops the branch links)
# The program will take care of those links above for you, so these notes are just in case you want to do something manually.
# 
# The 6th region is unused area containing text likely used for debugging the game, and has been tested to be safe for overwrites.
# Space:					0x1e8 					0x218 					0x110 					0x89c 					0x1b8 					0x1600			= 0x2564
v102CodeRegions = [ ( 0x22545c, 0x225644 ), ( 0x329428, 0x329640 ), ( 0x32a890, 0x32a9a0 ), ( 0x32b96c, 0x32c208 ), ( 0x39063c, 0x3907f4 ), ( 0x407950, 0x408f50 ) ]
v101CodeRegions = [ ( 0x224cd4, 0x224ebc ), ( 0x328750, 0x328968 ), ( 0x329bb8, 0x329cc8 ), ( 0x32ac94, 0x32B530 ), ( 0x38f95c, 0x38fb14 ), ( 0x406c70, 0x408270 ) ]
v100CodeRegions = [ ( 0x22414c, 0x224334 ), ( 0x327b00, 0x327d18 ), ( 0x328f68, 0x329078 ), ( 0x32a044, 0x32A8E0 ), ( 0x38e778, 0x38e930 ), ( 0x405990, 0x406f90 ) ]
vPALCodeRegions = [ ( 0x2272cc, 0x2274b4 ), ( 0x329704, 0x32991c ), ( 0x32AB6C, 0x32AC7C ), ( 0x32BC48, 0x32C4E4 ), ( 0x390564, 0x39071c ), ( 0x408810, 0x409e10 ) ]


# The value below affects the Code Offset Converter in the Tools tab. If set to False, the search will be much slower, but 
# will also have a little better chance of finding a match.
quickSearch = True