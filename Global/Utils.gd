extends Node


const SAVE_PATH: String = "user://savegame.bin"
const SAVE_PASS: String = "password"


func get_file(is_write: bool):
	var save_game: File = File.new()
	var password: String = SAVE_PASS

	if is_write:

		save_game.open_encrypted_with_pass(SAVE_PATH, File.WRITE, password)
	else:
		if not save_game.file_exists(SAVE_PATH):
			return

		save_game.open_encrypted_with_pass(SAVE_PATH, File.READ, password)
	return save_game
	
func save_game():
	var save_game: File = get_file(true)
	var data: Dictionary = {
		#
		#"level": Game.Level,
		"Plot": Game.Plot,
		"Harvests": Game.Harvests,
		"exp": Game.Exp,
		"level": Game.Level,
		"gold": Game.Gold,
		"unlock": Game.Unlocked,
		
	}
	#print(data)
#	print("save")
#	print("check")
	save_game.store_line(to_json(data))
	save_game.close()
	
func load_game():
	var save_game: File = get_file(false)
	if not save_game:
		return
	while not save_game.eof_reached():
		var current_line = parse_json(save_game.get_line())
		if current_line:
		
			Game.Plot = current_line["Plot"]
			Game.Harvests = current_line["Harvests"]
			Game.Exp = current_line["exp"]
			Game.Level = current_line["level"]
			Game.Gold = current_line["gold"]
			Game.Unlocked = current_line["unlock"]
	save_game.close()
