package media
{
	import flash.display.Sprite;
	import flash.events.Event;
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
		public static var muteSounds : int = 1; // if 0 that sound is muted
		public static var muteMusic : int = 1;
		
		private static var volumeEffectsTrans : SoundTransform = new SoundTransform(0.002 * volume);
		private static var volumeMusicTrans : SoundTransform = new SoundTransform(0.01 * volume);
		
		private static var soundChannel : SoundChannel = new SoundChannel();
		private static var musicChannel : SoundChannel = new SoundChannel();
		
		private static var totalSoundsLoaded : int = 0;
		public static var allSoundsLoaded : Boolean = false;
		private static var allUrls : Array = [];
		private static var allSounds : Array = [];
		
		
		public static function loadSounds() : void {
			
			// music
			allUrls.push(new URLRequest("https://www.dropbox.com/s/vs1zoxkyw1fkivx/Menu.mp3?dl=1")); //Background Menu Music
			allUrls.push(new URLRequest("https://www.dropbox.com/s/vclk1eprepo9kgg/InGame.mp3?dl=1")); //Background Game Music
			allUrls.push(new URLRequest("https://www.dropbox.com/s/icmfndektk5mpo1/boom.mp3?dl=1")); //Boom explosion sound
			allUrls.push(new URLRequest("https://www.dropbox.com/s/d4zdxtuy6j8lpdg/ShootSound.mp3?dl=1")); //shoot sound
			allUrls.push(new URLRequest("https://www.dropbox.com/s/60try4kw19d4sbh/IncomingEnemyRockets.mp3?dl=1")); //startLevel sound
			
			//sounds/effects
			for (var i : int = 0; i < allUrls.length; i++) {
				
				var sound : Sound = new Sound();
				sound.addEventListener(Event.COMPLETE, soundLoaded);
				sound.load(allUrls[i]);
				allSounds.push(sound);
				
			}
		}
		
		static private function soundLoaded(e:Event):void 
		{
			e.target.removeEventListener(Event.COMPLETE, soundLoaded);
			allSoundsLoaded += 1;
			if (allSoundsLoaded == allUrls.length && allSoundsLoaded == allSounds.length) {
				allSoundsLoaded = true;
			}
		}
		
		public static function playSound(soundInt : int) :void {
			var sound : Sound = new Sound();
			
			sound = allSounds[soundInt];
			
			if (sound != allSounds[MENU_BG_MUSIC] && sound != allSounds[GAME_BG_MUSIC]) {
				soundChannel = sound.play(0,0,volumeEffectsTrans);
			}else {
				musicChannel.stop();
				musicChannel = sound.play(0,9999,volumeMusicTrans);
			}
			
		}
	}

}