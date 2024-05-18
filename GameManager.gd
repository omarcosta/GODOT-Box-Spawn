extends Node
# Criar uma variavel de lista no inspetor do tipo cenas
@export var object_templates: Array[PackedScene]


func _input(event) -> void:
	# Filtra os evento e check se é um click de mouse
	if event is InputEventMouseButton:
		# Checa se o botão do mouse precionado foi o esquerdo
		if event.button_index == 1:
			# Checa se o evento foi preciosar ou soltar
			if event.pressed:
				# Chama a func e passa uma var Vector2 como parametro
				createBox(event.position)


func createBox(position: Vector2) -> void:
	# Cria uma variavel int randomica entre 0 e o tamanho da lista
	var index: int = randi_range(0, object_templates.size() -1)
	# Com o resultado randômico, pega um objeto na lista
	var object_template = object_templates[index]
	# Cria um clone do arquivo que foi carregado 
	var object = object_template.instantiate()
	# Define a posição do clone converme posição do click do mouse
	object.position = position
	add_child(object)
	
	
