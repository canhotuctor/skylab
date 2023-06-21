extends Control
signal okPressed(pos:Vector3, vel:Vector3)
signal posicUpdate(pos:Vector3)
var posic : Vector3 = Vector3(0,0,0)
var veloc : Vector3 = Vector3(0,0,0)

func _on_ok_pressed():
	veloc = Vector3($Panel/Velocidade/Vx.valor, $Panel/Velocidade/Vy.valor,$Panel/Velocidade/Vz.valor)
	okPressed.emit(posic, veloc)

func _on_x_changed_value(value):
	posic.x = value
	posicUpdate.emit(posic)
	
func _on_y_changed_value(value):
	posic.y = value
	posicUpdate.emit(posic)

func _on_z_changed_value(value):
	posic.z = value
	posicUpdate.emit(posic)
