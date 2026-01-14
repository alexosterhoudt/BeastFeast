extends Panel

func _can_drop_data(position, data):
	# Check if the data has the required format (e.g., an "item_node" key)
	if "item_node" in data:
		# Check if the slot is empty, compatible with item type, etc.
		# Example condition: 
		# if is_empty and data["item_node"].item_type == "weapon":
		return true
	return false

func _drop_data(position, data):
	var item = data["item_node"]
	var source_parent = data["source_parent"]

	# Reparent the item to the new slot
	source_parent.remove_child(item)
	add_child(item)
	
	# Reset the item's position relative to its new parent
	item.position = Vector2.ZERO # Or center it as needed

	# (Optional) Emit a signal to update other game logic or inventory data
	# GlobalSignals.emit_signal("item_dropped", source_parent.index, self.index, item.item_data)
