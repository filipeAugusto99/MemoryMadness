extends Node
# esse código serve para gerenciar e fornecer imagens aleatórias ou ordenadas.


const FRAME_IMAGES: Array[Texture2D] = [
	preload("res://assets/frames/blue_frame.png"),
	preload("res://assets/frames/green_frame.png"),
	preload("res://assets/frames/red_frame.png"),
	preload("res://assets/frames/yellow_frame.png")
]
# Constante com um array de texturas pré-carregadas (quatro molduras coloridas).
# O preload garante que os arquivos sejam carregados já na compilação da cena.


var _image_list: Array[Texture2D]
# Lista de imagens carregadas dinamicamente a partir do recurso salvo .tres.
# Inicialmente está vazia, e será preenchida no _enter_tree().


func _enter_tree() -> void:
	# Chamado quando o nó entra na árvore de cena.
	# Aqui carregamos a lista de arquivos de imagem do recurso .tres.
	var ifl: ImageFilesListResource = load("res://Resources/image_files_list.tres")
	# Carrega o recurso que contém a lista de caminhos das imagens.
	for file in ifl.file_names:
		# Percorre cada caminho de imagem armazenado.
		_image_list.append(load(file))
		# Carrega a textura em memória e adiciona na lista _image_list.


func get_random_item_image() -> Texture2D:
	return _image_list.pick_random()
	# Retorna uma imagem aleatória da lista carregada.
	

func get_random_frame_image() -> Texture2D:
	return FRAME_IMAGES.pick_random()
	# Retorna uma moldura aleatória da lista de molduras constantes.
	

func get_image(index: int) -> Texture2D:
	return _image_list[index]
	# Retorna uma imagem da lista com base no índice especificado.

func shuffle_images() -> void:
	_image_list.shuffle()
	# Embaralha a ordem da lista de imagens.
