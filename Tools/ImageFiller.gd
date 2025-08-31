@tool
# O @tool permite que o script seja executado no editor.
extends EditorScript
# Esse script é um EditorScript, ou seja, roda dentro do Editor da Godot (não no jogo em runtime).


const PATH: String = "res://assets/glitch/"
# Caminho da pasta onde estão os arquivos de imagem.
const RES_PATH: String = "res://Resources/image_files_list.tres"
# Caminho onde será salvo o recurso (resource) com a lista de arquivos de imagem.

func _run() -> void:
	# Função especial de EditorScript, é executada quando você roda o script no Editor.
	var dir: DirAccess = DirAccess.open(PATH)
	# Abre a pasta definida em PATH para acessar os arquivos dentro dela.
	var ifl: ImageFilesListResource = ImageFilesListResource.new()
	# Cria um novo recurso do tipo "ImageFilesListResource"
	
	if dir: 
		# Se a pasta foi aberta com sucesso...
		var files: PackedStringArray = dir.get_files()
		# Obtém a lista de arquivos dentro do diretório (retorna nomes, não os caminhos completos).
		for fn in files:
			# Itera sobre cada arquivo encontrado.
			ifl.add_file(PATH + fn)
			# Adiciona o arquivo na lista, já com o caminho completo.
	ResourceSaver.save(ifl, RES_PATH)
	# Salva o recurso gerado (com a lista de imagens) em RES_PATH,
	# para que você possa reutilizar em outros lugares do projeto.
