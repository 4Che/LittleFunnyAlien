extends Node

const GRAVITY = 250
const LEVEL_LIMIT = 3000
const UP = Vector2(0,-1) #направление вверх для обозначения платформинга сбоку

var lives = 3
var coins = 0
var fly_moving = "left"

func _ready():
	pass
