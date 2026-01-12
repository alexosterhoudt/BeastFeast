class_name InventoryBackpack
extends Control

@export var inventory : Inventory
@onready var slots_container: GridContainer = $Panel/MarginContainer/VBoxContainer/SlotsContainer
@onready var slot_template: Control = $SlotTemplate

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	inventory.changed.connect(refresh)
	refresh()

func refresh() -> void:
	for child in slots_container.get_children():
		child.queue_free()
	
	for slot in inventory.slots:
		var ui_slot = slot_template.duplicate()
		ui_slot.visible = true
		slots_container.add_child(ui_slot)
		
		ui_slot.get_node("Panel/CenterContainer/TextureRect").texture = slot.item.icon
		
		var count_label := ui_slot.get_node("Panel/Quantity")
		if slot.quantity > 1:
			count_label.text = str(slot.quantity)
			count_label.visible = true
		else:
			count_label.visible = false
		print(ui_slot.size)
		print(ui_slot.get_node("Panel/CenterContainer/TextureRect").size)
	
	slots_container.queue_sort()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("inventory"):
		visible = !visible
