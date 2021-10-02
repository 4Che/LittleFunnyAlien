extends Control


onready var settings_menu = $Settings


func _on_Quit_pressed():
	get_tree().quit() # Replace with function body.


func _on_Options_pressed():
	settings_menu.visible = true# Replace with function body.


func _on_Play_pressed():
	get_tree().change_scene("res://Levels/Level_1.tscn") # Replace with function body.
