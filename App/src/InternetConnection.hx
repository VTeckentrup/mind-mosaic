package;

import haxe.Http;

class InternetConnection
{

	/**
	* Checks to see if the internet is connected
	* by polling Google for a response code
	* 
	* Catch error to deal with potential firewalls
	* 
	* @param callback
	* @return
	*/
	public static function isAvailable(?callback:Bool->Void):Bool

	
	{
		var isAvailable:Bool = false;

		try {
			var http = new Http(db_address);

			trace("Query internet connection...");

			http.onError = function(status) {
				if (callback != null) {
					callback(false);
				}
				isAvailable = false;
				trace("Internet connection not available.");
			};

			http.onStatus = function(status) {
				if (callback != null) {
					callback(true);
				}
				isAvailable = true;
				trace("Internet connection available.");
			};

			http.request(false);

			return isAvailable;

		} catch ( msg : String ) {
			trace("Error occurred: " + msg);
			return false;
		}
	}

}