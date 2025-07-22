extends Area2D

const START = preload("res://Assets/Dialogue/start.dialogue")

func _on_body_entered(_body: CharacterBody2D):
	DialogueManager.show_example_dialogue_balloon(load("res://Assets/Dialogue/start.dialogue"))
	queue_free()
