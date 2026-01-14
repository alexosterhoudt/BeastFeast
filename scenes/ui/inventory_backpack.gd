extends Control
class_name InventoryBackpack

@export var inventory: Inventory
var slot_scene: PackedScene = preload("res://scenes/ui/slot_template.tscn")

@onready var slots_container := $Panel/MarginContainer/VBoxContainer/SlotsContainer

var ui_slots: Array[Control] = []
var isOpen : bool = false

func _ready():
	_build_slots()
	inventory.changed.connect(refresh_inventory)
	refresh_inventory()
	close()

func _build_slots():
	for i in inventory.size:
		var slot_ui := slot_scene.instantiate()
		slots_container.add_child(slot_ui)
		
		slot_ui.slot_index = i
		slot_ui.inventory = self
		
		ui_slots.append(slot_ui)

func refresh_inventory():
	for i in inventory.size:
		var data_slot = inventory.slots[i]
		var ui_slot = ui_slots[i]

		var icon := ui_slot.get_node("CenterContainer/Icon")
		var qty := ui_slot.get_node("Quantity")

		if data_slot == null:
			icon.visible = false
			qty.visible = false
		else:
			icon.texture = data_slot.item.icon
			icon.visible = true

			if data_slot.quantity > 1:
				qty.text = str(data_slot.quantity)
				qty.visible = true
			else:
				qty.visible = false

func request_swap(from_index : int, to_index : int):
	if from_index == to_index:
		return
	
	inventory.swap_slots(from_index, to_index)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("inventory"):
		if isOpen:
			close()
		else:
			open()

func open() -> void:
	visible = true
	isOpen = true

func close() -> void:
	visible = false
	isOpen = false
