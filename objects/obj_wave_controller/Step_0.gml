if (timer > 0)
{
    timer--;
    if (timer == 0)
    {
        current_wave_enemies = [];
        
        wave++;
        for (var i = 0; i < wave_enemynum[wave]; i++) {
        	var _enemy = instance_create_layer(random(room_width),0,layer,obj_enemy);
            array_push(current_wave_enemies,_enemy.id);
        }
    }
}
else 
{
	var _wave_enemies_alive = false;
    for (var i = 0; i < array_length(current_wave_enemies); i++) {
    	if (current_wave_enemies[i] != -1) _wave_enemies_alive = true;
    }
    
    if (_wave_enemies_alive == false)
    {
        timer = break_cooldown;
    }
}