extends Control

@onready var player_vars = get_node("/root/PlayerVariable")

var center = Vector2(0, 0)
var radius = 20
var mouse_in = false

const empty_color = Color(255, 255, 255, .2)
const fill_color = Color(0, 0, 0, 1)

var hammers = 0

func _process(delta):
	if hammers != player_vars.hammers:
		hammers = player_vars.hammers
		queue_redraw()


func _draw():
	var angle_from = 0
	var angle_to = 0
	for i in 3:
		angle_to += 120
		var color = empty_color
		if hammers > i:
			color = fill_color
		if hammers > i:
			print(color)
		draw_circle_arc_poly(center, radius, angle_from, angle_to, color)
		angle_from = angle_to
	
func draw_circle_arc_poly(center, radius, angle_from, angle_to, color):
	var nb_points = 32
	var points_arc = PackedVector2Array()
	points_arc.push_back(center)
	var colors = PackedColorArray([color])

	for i in range(nb_points + 1):
		var angle_point = deg_to_rad(angle_from + i * (angle_to - angle_from) / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
		draw_polygon(points_arc, colors)
