var game = new Phaser.Game(800, 400, Phaser.AUTO, 'phaser-game', {
	preload: _preload,
	create: _create
});

function _load_assets() {
		game.load.image('img_penguin_fill', 'assets/image/penguin_filler.png');
	game.load.image('img_penguin', 'assets/image/penguin.png');
	game.load.image('img_grnd_normal', 'assets/image/ground.png');
	game.load.spritesheet('spr_penguin', 'assets/image/penguin.png', 32, 32, -1, 0, 0);
	game.load.spritesheet('spr_penguin_fill', 'assets/image/penguin_filler.png', 32, 32, -1, 0, 0);
	game.load.spritesheet('spr_grnd_normal', 'assets/image/ground.png', 32, 32, -1, 0, 0);

}

function _preload() {
_load_assets();
	game.state.add('StatePlay', StatePlay);
	game.state.start('StatePlay');
}

function _create() {
	
}
