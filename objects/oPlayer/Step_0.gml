/// @desc Core player logic
// get player inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

// Calculate Movement
var _move = key_right - key_left;

hsp = _move * walksp;

vsp = vsp + grv;

//Horizontal Collision
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x +sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//Verticle Collision
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y +sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;