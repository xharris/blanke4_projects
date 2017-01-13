/*
 * Ground entity class
 *
 */

function Ground(x, y, type='normal') {
	this.x = x;
  	this.y = y;
  
  	this.spr = game.add.sprite(this.x, this.y, 'spr_grnd_'+type);
  
  	group_ground.add(this.spr);
  	collgroup_ground.add(this.spr);
  
  	this.spr.body.immovable = true;
  	this.spr.body.gravity = 0;
}