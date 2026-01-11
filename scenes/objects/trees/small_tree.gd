extends Sprite2D

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent

@export var item_data : ItemData

func _ready() -> void:
	hurt_component.hurt.connect(on_hurt)
	damage_component.max_damage_reached.connect(on_max_damage_reached)

func on_hurt(hit_damage : int) -> void:
	damage_component.apply_damage(hit_damage)

func on_max_damage_reached() -> void:
	call_deferred("add_log_scene")
	print("Dead")
	queue_free()

func add_log_scene() -> void:
	var item = item_data.world_item_scene.instantiate()
	item.setup(item_data)
	item.global_position = global_position
	get_parent().add_child(item)
