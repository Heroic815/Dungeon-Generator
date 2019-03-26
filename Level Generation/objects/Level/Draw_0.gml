for(var i = 0; i < level_width; i++)
{
	for(var j = 0; j < level_height; j++)
	{
		switch(level[# i, j])
		{
			case FLOOR: draw_sprite(s_floor, 0, TILE_SIZE * i, TILE_SIZE * j);
			break;
			
			case WALL: draw_sprite(s_wall, 0, TILE_SIZE * i, TILE_SIZE * j);
			break;
		}
	}
}