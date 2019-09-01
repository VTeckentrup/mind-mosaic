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
	* If internet connection is available retrieve latest database IP
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
			
			// Retrieve current database IP
			if (isAvailable == true) 
			{
				var database_current_json = new haxe.Http(host_address_url);

				database_current_json.onData = function (data:String) {
					var result = haxe.Json.parse(data);
					host_address = result.ip;
				}

				database_current_json.onError = function (error) {
					trace("Error: Current database address not received due to" + error);
				}

				database_current_json.request();
			}

			return isAvailable;

		} catch ( msg : String ) {
			trace("Error occurred: " + msg);
			return false;
		}
	}

}