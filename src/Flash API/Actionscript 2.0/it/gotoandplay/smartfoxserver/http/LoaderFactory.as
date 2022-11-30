﻿import it.gotoandplay.smartfoxserver.http.*/** * LoaderFactory class. *  * @version	1.0.0 *  * @author	The gotoAndPlay() Team * 			{@link http://www.smartfoxserver.com} * 			{@link http://www.gotoandplay.it} *  * @exclude */class it.gotoandplay.smartfoxserver.http.LoaderFactory{	private static var DEFAULT_POOL_SIZE:Number = 8		private var webUrl:String	private var loaderParamName:String	private var poolSize:Number	private var sendersPool:Array	private var loadersPool:Array	private var currentIndex:Number		function LoaderFactory(httpConnection:HttpConnection, responseHandler:Function, _webUrl:String, _loaderParamName:String, _poolSize:Number)	{		if (_poolSize > 0)			poolSize = _poolSize		else			poolSize = DEFAULT_POOL_SIZE				webUrl = _webUrl		loaderParamName = _loaderParamName				sendersPool = []		loadersPool = []				for (var i:Number = 0; i < poolSize; i++)		{			var sender = new LoadVars()			var loader = new LoadVars()						loader._classRef = httpConnection			loader.onData = responseHandler			//loader.onHTTPStatus = handleHTTPStatus						sendersPool.push(sender)			loadersPool.push(loader)		}				currentIndex = 0	}		public function sendAndLoad(message:String):Void	{		var sender:LoadVars = sendersPool[currentIndex]		var loader:LoadVars = loadersPool[currentIndex]				sender[loaderParamName] = message		sender.sendAndLoad(webUrl, loader)				currentIndex++				if (currentIndex >= poolSize)			currentIndex = 0	}		public function handleHTTPStatus(status:Number)	{		trace("---> Status received: " + status)	}}