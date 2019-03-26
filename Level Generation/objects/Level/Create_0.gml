randomize();

//Level values
#macro TILE_SIZE 32
#macro FLOOR -5
#macro WALL -6

level_width = room_width div TILE_SIZE;
level_height = room_height div TILE_SIZE;

level = ds_grid_create(level_width, level_height);

ds_grid_clear(level, WALL);

//Create controller
var controller_x = level_width div 2;
var controller_y = level_height div 2;
var controller_dir = irandom(3);
var direction_change_odds = 1;
var enemy_spawn_chance = 0.2;

var steps = 750;
repeat(steps)
{
	level[# controller_x, controller_y] = FLOOR;
	
	//Randomize direction
	if(irandom(direction_change_odds) == direction_change_odds)
	{
		controller_dir = irandom(3);
	}
	
	//Spawn enemies
	if(random(1) <= enemy_spawn_chance)
	{
		instance_create_layer(controller_x * TILE_SIZE, controller_y * TILE_SIZE, "Instances", Enemy);
	}
	
	//Move the controller
	var controller_xdir = lengthdir_x(1, controller_dir * 90);
	var controller_ydir = lengthdir_y(1, controller_dir * 90);
	controller_x += controller_xdir;
	controller_y += controller_ydir;
	
	//Clamp controller to grid
	if(controller_x < 2 or controller_x >= level_width - 2)
	{
		controller_x += -controller_xdir * 2;
	}
	if(controller_y < 2 or controller_y >= level_height - 2)
	{
		controller_y += -controller_ydir * 2;
	}
}

remove_single_tiles();