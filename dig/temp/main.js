var game = new Phaser.Game(800, 600, Phaser.CANVAS, 'phaser-game', {
	preload: _preload,
	create: _create
});

function _load_assets() {
		game.load.image('img_player', 'assets/image/player.png');
	game.load.image('img_dirt', 'assets/image/dirt.png');
	game.load.image('img_grass', 'assets/image/grass.png');

}

function _preload() {
_load_assets();
	game.state.add('st_main', st_main);
	game.state.start('st_main');
}

function _create() {
	
}
