import Math;

// The code for this class and functions is taken from HaxeFlixel (http://haxeflixel.com/) and is included as a separate file as Flixel is 
// currently not compatible with newer versions of OpenFL and Lime
class NormRandom
{
		//helper variables for floatNormal -- it produces TWO random values with each call so we have to store some state outside the function
		static var _hasFloatNormalSpare:Bool = false;
		static var _floatNormalRand1:Float = 0;
		static var _floatNormalRand2:Float = 0;
		static var _twoPI:Float = Math.PI * 2;
		static var _floatNormalRho:Float = 0;
		
		/**
		 * Returns a pseudorandom float value in a statistical normal distribution centered on Mean with a standard deviation size of StdDev.
		 * (This uses the Box-Muller transform algorithm for gaussian pseudorandom numbers)
		 * 
		 * Normal distribution: 68% values are within 1 standard deviation, 95% are in 2 StdDevs, 99% in 3 StdDevs.
		 * See this image: https://github.com/HaxeFlixel/flixel-demos/blob/dev/Performance/FlxRandom/normaldistribution.png
		 * 
		 * @param	Mean		The Mean around which the normal distribution is centered
		 * @param	StdDev		Size of the standard deviation
		 */
		public static function floatNormal(Mean:Float = 0, StdDev:Float = 1):Float
		{
			if (_hasFloatNormalSpare)
			{
				_hasFloatNormalSpare = false;
				var scale:Float = StdDev * _floatNormalRho;
				return Mean + scale * _floatNormalRand2;
			}
			
			_hasFloatNormalSpare = true;
			
			var theta:Float = _twoPI * (generate() / MODULUS);
			_floatNormalRho = Math.sqrt( -2 * Math.log(1 - (generate() / MODULUS)));
			var scale:Float = StdDev * _floatNormalRho;
			
			_floatNormalRand1 = Math.cos(theta);
			_floatNormalRand2 = Math.sin(theta);
			
			return Mean + scale * _floatNormalRand1;
		}
		
		/**
		 * Internal method to quickly generate a pseudorandom number. Used only by other functions of this class.
		 * Also updates the internal seed, which will then be used to generate the next pseudorandom number.
		 * 
		 * @return  A new pseudorandom number.
		 */
		static inline function generate():Float
		{
			return internalSeed = (internalSeed * MULTIPLIER) % MODULUS;
		}
		
		/**
		 * The actual internal seed. Stored as a Float value to prevent inaccuracies due to
		 * integer overflow in the generate() equation.
		 */
		//static var internalSeed:Float = 1;
		static var internalSeed:Float = Sys.time() * 1000.0;
		
		/**
		 * Constants used in the pseudorandom number generation equation.
		 * These are the constants suggested by the revised MINSTD pseudorandom number generator,
		 * and they use the full range of possible integer values.
		 * 
		 * @see http://en.wikipedia.org/wiki/Linear_congruential_generator
		 * @see Stephen K. Park and Keith W. Miller and Paul K. Stockmeyer (1988).
		 *      "Technical Correspondence". Communications of the ACM 36 (7): 105–110.
		 */
		private static inline var MULTIPLIER:Float = 48271.0;
		public static inline var MAX_VALUE_INT:Int = 0x7FFFFFFF;
		private static inline var MODULUS:Int = MAX_VALUE_INT;
	
}