extends Panel

@export var pixels_per_second: float = 100.0
@export var duration: float = 2.0

var time_labels: Array[Label] = []
@onready var choreo_time: Panel = $ChoreoTime

func _ready() -> void:
	update_ruler()

func set_duration(new_duration: float) -> void:
	duration = new_duration
	update_ruler()

func update_ruler() -> void:
	# Clear existing labels from ChoreoTime
	for label in time_labels:
		label.queue_free()
	time_labels.clear()
	
	# Update both Ruler and ChoreoTime width based on duration
	var total_width = duration * pixels_per_second
	custom_minimum_size.x = total_width
	choreo_time.custom_minimum_size.x = total_width
	
	# Create time labels inside ChoreoTime
	var total_seconds = int(duration)
	for i in range(total_seconds + 1):
		var label = Label.new()
		label.text = str(i) + "s"
		label.position = Vector2(i * pixels_per_second, 10)
		choreo_time.add_child(label)
		time_labels.append(label)
		print("Created:"+ label.text)


func _on_choreo_duration_value_changed(value: float) -> void:
	duration = value
	update_ruler()
