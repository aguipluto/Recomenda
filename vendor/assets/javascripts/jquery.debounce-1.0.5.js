/**
 * Debounce and throttle function's decorator plugin 1.0.5
 *
 * Copyright (c) 2009 Filatov Dmitry (alpha@zforms.ru)
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 *
 */

(function($) {

$.extend({

	debounce : function(fn, timeout, invokeAsap, ctx) {

        console.log('entra0');
		if(arguments.length == 3 && typeof invokeAsap != 'boolean') {
			ctx = invokeAsap;
			invokeAsap = false;
		}

		var timer;

        console.log('entra1');
		return function() {

            console.log('entra2');
			var args = arguments;
            ctx = ctx || this;
            console.log('entra3');
			invokeAsap && !timer && fn.apply(ctx, args);
            console.log('entra4');
			clearTimeout(timer);
            console.log('entra5');
			timer = setTimeout(function() {
				!invokeAsap && fn.apply(ctx, args);
				timer = null;
			}, timeout);

		};

	},

	throttle : function(fn, timeout, ctx) {

		var timer, args, needInvoke;

		return function() {

			args = arguments;
			needInvoke = true;
			ctx = ctx || this;

			if(!timer) {
				(function() {
					if(needInvoke) {
						fn.apply(ctx, args);
						needInvoke = false;
						timer = setTimeout(arguments.callee, timeout);
					}
					else {
						timer = null;
					}
				})();
			}

		};

	}

});

})(jQuery);