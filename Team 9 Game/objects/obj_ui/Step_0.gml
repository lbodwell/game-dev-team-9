// Determine player hints
with (obj_player) {
	other.hint_id = show_hint
}
switch (hint_id) {
	case 1: {
		hint = "Use A and D to move left and right. Use space to jump."
	}
	break;
	case 2: {
		hint = "Use the mouse to aim your weapon.\nHold the left mouse button to fire."
	}
	break;
	case 3: {
		hint = "Hold SHIFT while moving to dash.\nThis consumes energy so use it wisely.\nGain more energy by moving and killing enemies."
	}
	break;
	case 4: {
		hint = "Hold CTRL when you jump to activate your super jump.\nThis ability consumes 20% energy."
	}
	break;
	case 5: {
		hint = "Maybe try combining your dash and super jump abilites..."
	}
	break;
	case 6: {
		hint = "If you take a lot of damage, you can restore half of your health using F.\nThis ability uses 30% of your energy."
	}
	break;
	case 7: {
		hint = "Use the right mouse button to activate your repulsor,\ndecimating nearby enemies and destructable objects.\nThis ability uses 50% of your energy."
	}
	break;
	case 8: {
		hint = "Congratulations, you beat the first level!";
	}
	break;
}