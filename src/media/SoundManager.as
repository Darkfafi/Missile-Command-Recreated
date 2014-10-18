package media
{
	import flash.display.Sprite;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundMixer;
	import flash.media.SoundTransform;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author Ramses di Perna
	 */
	public class SoundManager
	{
		public static const MENU_BG_MUSIC : int = 0;
		public static const GAME_BG_MUSIC : int = 1;
		public static const EXPLOSION : int = 2;
		public static const SHOOT : int = 3;
		public static const START_LEVEL : int = 4;
		
		public static var volume : int = 100;
		public static var muteSounds : Boolean = false;
		public static var muteMusic : Boolean = false;
		
		private static var musicTransform : SoundTransform = new SoundTransform(1);
		
		private static var soundChannel : SoundChannel = new SoundChannel();
		private static var musicChannel : SoundChannel = new SoundChannel();
		
		public static var allSoundsLoaded : Boolean = false;
		
		private static var allUrls : Array = [];
		private static var allSounds : Array = [];
		
		
		public static function loadSounds() : void {
			// music
			allUrls.push(new URLRequest("http://download1521.mediafire.com/d7l0q3izaxqg/q3xs950l3dmyshn/Menu.mp3")); //Background Menu Music
			allUrls.push(new URLRequest("http://download1572.mediafire.com/kz3am9z6qz8g/qj981ela57bh3ar/InGame.mp3")); //Background Game Music
			allUrls.push(new URLRequest("http://download1650.mediafire.com/1eboiubu4vjg/a8t363h0e45cjlf/boom.mp3")); //Boom explosion sound
			allUrls.push(new URLRequest("http://download1487.mediafire.com/1zpkjps177ug/2fsdykaonhbbvav/ShootSound.mp3")); //shoot sound
			allUrls.push(new URLRequest("http://download1351.mediafire.com/jct604fyev1g/clk5vwyff9a4ka6/IncomingEnemyRockets.mp3")); //startLevel sound
			
			//sounds/effects
			
			
			for (var i : int = 0; i < allUrls.length; i++) {
				var sound : Sound = new Sound();
				
				sound.load(allUrls[i]);
				
				if (sound.bytesLoaded == sound.bytesTotal) {
					
					allSounds.push(sound);
					
					if (allSounds.length == allUrls.length) {
						allSoundsLoaded = true;
					}
				}
			}
		}
		public static function playSound(soundInt : int) :void {
			var sound : Sound = new Sound();
			
			sound = allSounds[soundInt];
			
			if (sound != allSounds[MENU_BG_MUSIC] && sound != allSounds[GAME_BG_MUSIC]) {
				soundChannel = sound.play(0,0,musicTransform);
			}else {
				musicChannel.stop();
				musicChannel = sound.play(0,9999,musicTransform);
			}
			
		}
	}

}