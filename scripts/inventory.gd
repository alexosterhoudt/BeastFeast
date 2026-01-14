class_name Inventory
extends Node

@export var size := 15
var slots : Array[InventorySlot] = []

signal changed

func _init() -> void:
	for i in size:
		slots.append(null)

func add_item(item: ItemData, amount := 1):
	# Stack first
	for i in slots.size():
		var slot = slots[i]
		if slot and slot.item == item:
			slot.quantity += amount
			changed.emit()
			return

	# Find empty slot
	for i in slots.size():
		if slots[i] == null:
			var new_slot := InventorySlot.new()
			new_slot.item = item
			new_slot.quantity = amount
			slots[i] = new_slot
			changed.emit()
			return

func swap_slots(a: int, b: int):
	var temp = slots[a]
	slots[a] = slots[b]
	slots[b] = temp
	changed.emit()
