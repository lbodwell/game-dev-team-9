// Determine player hints
with (obj_player) {
	other.hint_id = show_hint;
}
switch (hint_id) {
	case 1: {
		hint = "Use A and D to move left and right. Use space to jump."
	}
	break;
	case 2: {
		hint = "Watch out for falling platforms.\nIf they disappear, you'll fall into the dangerous spikes!"
	}
	break;
	case 3: {
		hint = "Hold SHIFT while moving to sprint.\nThis consumes energy so use it wisely.\nGain more energy by moving and killing enemies."
	}
	break;
	case 4: {
		hint = "Use the mouse to aim your weapon.\nHold the left mouse button to fire."
	}
	break;
	case 5: {
		hint = "Hold CTRL when you jump to activate your super jump.\nThis ability consumes 20% energy."
	}
	break;
	case 6: {
		hint = "Use the right mouse button to activate your repulsor,\ndecimating nearby enemies and destructable objects.\nThis ability consumes 50% energy."
	}
	break;
	case 7: {
		hint = "If you take a lot of damage, you can restore half of your health using F.\nThis ability consumes 30% energy."
	}
	break;
	case 8: {
		hint = "Remember, you can also use your repulsor on destructable objects.";
	}
	break;
	case 9: {
		hint = "Maybe try combining your sprint and super jump abilites...";
	}
	break;
	case 10: {
		hint = "Congratulations, you beat the first level!";
		
	}
	break;
}