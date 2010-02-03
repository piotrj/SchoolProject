// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

/**
 * jQuery.timers - Timer abstractions for jQuery
 * Written by Blair Mitchelmore (blair DOT mitchelmore AT gmail DOT com)
 * Licensed under the WTFPL (http://sam.zoy.org/wtfpl/).
 * Date: 2009/10/16
 *
 * @author Blair Mitchelmore
 * @version 1.2
 *
 **/

jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

jQuery.fn.extend({
	everyTime: function(interval, label, fn, times) {
		return this.each(function() {
			jQuery.timer.add(this, interval, label, fn, times);
		});
	},
	oneTime: function(interval, label, fn) {
		return this.each(function() {
			jQuery.timer.add(this, interval, label, fn, 1);
		});
	},
	stopTime: function(label, fn) {
		return this.each(function() {
			jQuery.timer.remove(this, label, fn);
		});
	}
});

jQuery.extend({
	timer: {
		global: [],
		guid: 1,
		dataKey: "jQuery.timer",
		regex: /^([0-9]+(?:\.[0-9]*)?)\s*(.*s)?$/,
		powers: {
			// Yeah this is major overkill...
			'ms': 1,
			'cs': 10,
			'ds': 100,
			's': 1000,
			'das': 10000,
			'hs': 100000,
			'ks': 1000000
		},
		timeParse: function(value) {
			if (value == undefined || value == null)
				return null;
			var result = this.regex.exec(jQuery.trim(value.toString()));
			if (result[2]) {
				var num = parseFloat(result[1]);
				var mult = this.powers[result[2]] || 1;
				return num * mult;
			} else {
				return value;
			}
		},
		add: function(element, interval, label, fn, times) {
			var counter = 0;
			
			if (jQuery.isFunction(label)) {
				if (!times) 
					times = fn;
				fn = label;
				label = interval;
			}
			
			interval = jQuery.timer.timeParse(interval);

			if (typeof interval != 'number' || isNaN(interval) || interval < 0)
				return;

			if (typeof times != 'number' || isNaN(times) || times < 0) 
				times = 0;
			
			times = times || 0;
			
			var timers = jQuery.data(element, this.dataKey) || jQuery.data(element, this.dataKey, {});
			
			if (!timers[label])
				timers[label] = {};
			
			fn.timerID = fn.timerID || this.guid++;
			
			var handler = function() {
				if ((++counter > times && times !== 0) || fn.call(element, counter) === false)
					jQuery.timer.remove(element, label, fn);
			};
			
			handler.timerID = fn.timerID;
			
			if (!timers[label][fn.timerID])
				timers[label][fn.timerID] = window.setInterval(handler,interval);
			
			this.global.push( element );
			
		},
		remove: function(element, label, fn) {
			var timers = jQuery.data(element, this.dataKey), ret;
			
			if ( timers ) {
				
				if (!label) {
					for ( label in timers )
						this.remove(element, label, fn);
				} else if ( timers[label] ) {
					if ( fn ) {
						if ( fn.timerID ) {
							window.clearInterval(timers[label][fn.timerID]);
							delete timers[label][fn.timerID];
						}
					} else {
						for ( var fn in timers[label] ) {
							window.clearInterval(timers[label][fn]);
							delete timers[label][fn];
						}
					}
					
					for ( ret in timers[label] ) break;
					if ( !ret ) {
						ret = null;
						delete timers[label];
					}
				}
				
				for ( ret in timers ) break;
				if ( !ret ) 
					jQuery.removeData(element, this.dataKey);
			}
		}
	}
});

jQuery(window).bind("unload", function() {
	jQuery.each(jQuery.timer.global, function(index, item) {
		jQuery.timer.remove(item);
	});
});

$(document).ready(function(){
	$("#counter").everyTime("1s", "count", function() {
		seconds = $("#seconds").text();
		minutes = $("#minutes").text();
		
		if(seconds.charAt(0) == "0") {
			seconds = seconds.charAt(1)
		}
		
		if(parseInt(seconds) == 0) {
			if(minutes == 0) {
				$("#counter").stopTime("count")
				$(".edit_student_answer").submit()
			} else {
				$("#seconds").text(59);
				$("#minutes").text(parseInt(minutes)-1);
			}
		} else {

			seconds = (parseInt(seconds) - 1).toString();
			if (seconds.length == 1) {
				seconds = "0" + seconds;
			}
			$("#seconds").text(seconds);
		}
	});
	
	
	$("#available_categories li").draggable({ helper: 'clone' });
	$("#categories_fields").droppable({
		hoverClass: 'drop_hover',
		drop: function(event, ui) {
			id = ui.draggable.find(".id").text()
			text = ui.draggable.find(".name").text()
			number = $(".category_input").size()
			fields_html = '<p class="category_input">\
			              <input type="hidden" value="myid" name="school_test[test_categories_attributes][mynumber][category_id]" id="school_test_test_categories_attributes_mynumber_category_id">\
			              <label for="school_test_test_categories_attributes_mynumber_Liczba">mylabel</label>\
			              <input type="text" size="30" name="school_test[test_categories_attributes][mynumber][number]" id="school_test_test_categories_attributes_mynumber_number">\
										<a style="" href="#" class="remove_category_a">remove</a>\
			            </p>';
			
	    fields_html = fields_html.replace(/myid/g,id)
		  fields_html = fields_html.replace(/mylabel/g,text)
		 	fields_html = fields_html.replace(/mynumber/g,number)
			$(this).append(fields_html)
			$(".remove_category_a").bind('click', function() {
				$(this).parents(".category_input").remove();
				return false;
			});
		}
	});
	$(".remove_category").show();
	$(".remove_category").bind('click', function() {
		$(this).parents(".category_input").find(".destroy_field").attr("value", "true")
		$(this).parents(".category_input").hide()
		return false;
	});
});