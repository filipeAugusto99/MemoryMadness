extends Resource
# Essa classe herda de Resource, o que significa que pode ser salva em disco como um .tres ou .res
# e reutilizada em qualquer parte do projeto Godot.


class_name ImageFilesListResource
# Dá um nome global para a classe.
# Isso permite que você use "ImageFilesListResource" diretamente no código,
# sem precisar de preload() ou load() do script.


@export var file_names: Array[String]
# Variável exportada chamada file_names, que guarda uma lista de strings.
# Aqui serão armazenados os caminhos dos arquivos de imagem.
# Como é exportada, também aparece no Inspetor do Godot.


func add_file(fn: String) -> void:
	# Função que adiciona um arquivo na lista, se for válido.
	if fn.ends_with(".import") == false:
		# Quando você importa uma imagem no Godot, ele cria um arquivo auxiliar .import.
		# Esse arquivo não é a imagem real, então aqui o código ignora arquivos .import.
		file_names.append(fn)
		# Adiciona o caminho do arquivo válido (ex: PNG, JPG, etc.) na lista.
