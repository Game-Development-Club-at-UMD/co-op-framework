extends Node2D

## Determines the minimum number of players your game can have. Ranges from 1 to 4.
## This will likely be fetched from export settings on the developer's actual game in the future.
@export_range(1, 4, 1) var minimum_players: int = 1

## Determines the max number of players your game can have. Ranges from 1 to 4.
## This will likely be fetched from export settings on the developer's actual game in the future.
@export_range(1, 4, 1) var maximum_players: int = 4
