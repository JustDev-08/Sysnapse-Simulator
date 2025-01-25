extends StaticBody2D
var cagate_count=0
var cagate_open = false
var cagate_cooldown = 5
var Ca = preload("res://asset/Scene/Ca.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	gatecontrol(delta)

func _on_button_button_down() -> void:
	if (!cagate_open):
		$Cagate/AnimatedSprite2D.animation = 'open'
		cagate_open = true
		
		
func gatecontrol(delta):
	if cagate_count >=cagate_cooldown:
		cagate_count = 0
		$Cagate/AnimatedSprite2D.animation = 'closed'
		cagate_open=false
	if cagate_open == true :
		cagate_count +=delta
 	
	


func _on_button_2_button_down() -> void:
	var instance = Ca.instantiate()
	instance.position = $Cagate.position + Vector2(-100,-200)
	$CaArea/Ca.add_child(instance)
