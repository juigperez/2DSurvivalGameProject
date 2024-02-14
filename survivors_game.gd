extends Node2D

var i_mob = 5 # Number of mob spawned at the start
var n_mob = 1 # Number of mob spawned at regular timeout

func _ready():
	spawn_mob(i_mob)


func spawn_mob(num_mob):
	for n in num_mob:
		var new_mob = preload("res://mob.tscn").instantiate()
		%PathFollow2D.progress_ratio = randf()
		new_mob.global_position = %PathFollow2D.global_position
		add_child(new_mob)


func _on_timer_timeout():
	spawn_mob(n_mob)


func _on_player_health_depleted():
	%GameOver.visible = true
	get_tree().paused = true
