class_name Inventory
extends Node

@export var size := 4
var slots : Array[InventorySlot] = []

signal changed

func add_item(item_data : ItemData, amount := 1) -> bool:
	var success := false
	for slot in slots:
		if slot.item == item_data and not slot.is_full():
			var can_add = min(amount, item_data.stack_size - slot.quantity)
			slot.quantity += can_add
			amount -= can_add
			changed.emit()
			if amount <= 0:
				return true
	
	while amount > 0 and slots.size() < size:
		var to_add = min(amount, item_data.stack_size)
		slots.append(InventorySlot.new(item_data, to_add))
		amount -= to_add
	changed.emit()
	return amount == 0
	return success
