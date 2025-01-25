extends Node2D

var Particle = $".".get_children(true)
var R = []
var range = 5
var epsilon = 1
var sigma =1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#randomize()
	#for a in range(10):  # Create 5 random instances
		#create_random_instance()
	Particle = $".".get_children(true)
	range = len(Particle)
	for i in range:
		R.append([])
		for j in range:
			R[i].append(0) # Set a starter value for each position
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Particle = $".".get_children(true)
	range = len(Particle)
	for i in range:
		R.append([])
		for j in range:
			R[i].append(0) # Set a starter value for each position
	for i in range(len(Particle)):
		for j in range(len(Particle)):
			if i==j:
				R[i][j] = 0
			else :
				R[i][j] = sqrt((Particle[i].position[0]-Particle[j].position[0])**2+ (Particle[i].position[1]-Particle[j].position[1])**2)			
	#print(Force(1,epsilon,sigma), Force(0,epsilon,sigma))
	for i in len(Particle):
		Particle[i].apply_central_force(Force(i,epsilon,sigma))
func Force(i,epilon,sigma):
	var SumDp=Vector2(0,0)
	for j in range(len(Particle)):
		if i==j:
			continue
		SumDp += -24*epilon*(2*sigma**12/R[i][j]**14-sigma**6/R[i][j]**8)*Vector2((Particle[i].position[0]-Particle[j].position[0]),(Particle[i].position[1]-Particle[j].position[1]))
		
	return -SumDp
