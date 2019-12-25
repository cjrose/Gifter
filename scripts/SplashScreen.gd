extends MarginContainer

func _on_Timer_timeout():
	self.get_tree().change_scene("res://_scenes/Menu.tscn")
