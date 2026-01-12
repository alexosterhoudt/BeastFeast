class_name InventorySlot

var item : ItemData
var quantity : int

func _init(item_data : ItemData, amount := 1):
	item = item_data
	quantity = amount

func is_full() -> bool:
	return quantity >= item.stack_size
