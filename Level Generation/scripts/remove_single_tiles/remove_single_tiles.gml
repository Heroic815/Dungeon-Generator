for(var i = 0; i < level_width; i++)
{
	for(var j = 0; j < level_height; j++)
	{
		var up = level[# i, j - 1];
		var down = level[# i, j + 1];
		var left = level[# i - 1, j];
		var right = level[# i + 1, j];
		
		if(level[# i, j] == WALL) and (up == FLOOR and down == FLOOR and left == FLOOR and right == FLOOR)
		{
			level[# i, j] = FLOOR;
		}
	}
}