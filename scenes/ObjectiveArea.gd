extends Area2D

func _on_ObjectiveArea_body_entered(body):
	get_tree().change_scene("res://scenes/VictoryScreen.tscn")

