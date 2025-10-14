extends Node
class_name JetComponent

@export var actor : Jet
@export var rarity : String 
@export var stats : Dictionary
signal _on_component_euqipped
signal _on_component_removed


# Apply component stats to actor.
func apply_component():
	for stat in stats:
		actor.set(stat, actor.get(stat) + stats[stat])
	_on_component_euqipped.emit()
# Remove component stats to actor.
func remove_component():
	for stat in stats:
		actor.set(stat, actor.get(stat) - stats[stat])
	_on_component_removed.emit()
