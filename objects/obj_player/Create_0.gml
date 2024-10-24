/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
#region variaveis

	velocidade = 2;

	espera_tiro = 20;
	
	timer_tiro = 0;
	
	level_tiro = 1;

#endregion

#region metodos

controla_player = function(){
	

	
	var _cima, _baixo, _esq, _dire, _atirar;
	
	_cima	= keyboard_check(ord("W")) or keyboard_check(vk_up);
	_baixo  = keyboard_check(ord("S")) or keyboard_check(vk_down);
	_esq	= keyboard_check(ord("A")) or keyboard_check(vk_left);
	_dire	= keyboard_check(ord("D")) or keyboard_check(vk_right);
	_atirar = keyboard_check(vk_space) or mouse_check_button(mb_left);

	var _velh = (_dire - _esq) * velocidade;
	var _velv = (_baixo - _cima) * velocidade;
	
	x += _velh;
	y += _velv;
	
	//if(x <= sprite_width / 2)
	//{
	//	x = sprite_width / 2;	
	//}
	//if(x >= room_width - sprite_width / 2)
	//{
	//	x = room_width - sprite_width / 2	
	//}
	
	
	x = clamp(x, sprite_width / 2, room_width - sprite_width / 2);
	y = clamp(y, sprite_height / 2, room_height - sprite_height / 2);

	timer_tiro--;

	if(_atirar == true && timer_tiro <= 0)
	{
		timer_tiro = espera_tiro;
		
		if(level_tiro == 1)
		{
			tiro_1();	
		}
		if(level_tiro == 2)
		{
			tiro_2();	
		}
		if(level_tiro == 3)
		{
			tiro_3();	
		}
			
	}


	/* if(_cima == true)
	{
		y -= velocidade;
	}	
	
	if(_baixo == true)
	{
		y += velocidade;	
	}
	
	if(_esq == true)
	{
		x -= velocidade;	
	}
	
	if(_dire == true)
	{
		x += velocidade;	
	}
	*/
}

tiro_1 = function(){
	
	var _tiro = instance_create_layer(x, y, "Tiros", obj_tiro_player);
		
	_tiro.vspeed = -6;
	
}

tiro_2 = function(){
	
	var _tiro = instance_create_layer(x - 12, y, "Tiros", obj_tiro_player)
	_tiro.vspeed = -6;
	
	_tiro = instance_create_layer(x + 12, y, "Tiros", obj_tiro_player)
	_tiro.vspeed = -6;	
	
}


tiro_3 = function(){
	
	var _tiro = instance_create_layer(x - 12, y, "Tiros", obj_tiro_player)
	_tiro.vspeed = -6;
	
	_tiro = instance_create_layer(x, y, "Tiros", obj_tiro_player)
	_tiro.vspeed = -6.2;
	
	_tiro = instance_create_layer(x + 12, y, "Tiros", obj_tiro_player)
	_tiro.vspeed = -6;	
	
}



#endregion