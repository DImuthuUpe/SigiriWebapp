// -------------------------------------------------
// artViper's mooSlide 3.2.1 revamp for mooTools 1.2
// -------------------------------------------------
// if you make significant changes, extensiosn etc
// please drop us a copy at admin@artviper.net
// -------------------------------------------------
// more mootools based stuff can be found at:
// ------------- www.artviper.net ------------------

	var mooSlide2 = new Class({
		options:	{
						slideSpeed: 500,
						fadeSpeed:	500,
						effects:	Fx.Transitions.linear,
						toggler:	"myToggle",
						contentID:	 null,
						removeOnClick: true,
						from:		'top',
						opacity:	0.5,
						height:		0,
						isOpen:		0,
						executeFunction: null,
						loadExternal: null,
						request: null
					},

		initialize:	function(options){
			this.setOptions(options);
			if(options['toggler']) this.toggler = options['toggler'];
			if(options['content']) this.content = $(options['content']);
			if(options['height']) this.height = options['height'];
			if(options['opacity']) this.opacity = options['opacity'];
			if(options['slideSpeed']) this.slideSpeed = options['slideSpeed'];
			if(options['fadeSpeed']) this.fadeSpeed = options['fadeSpeed'];
			if(options['close']) this.close = options['close'];
			if(options['from']) this.from = options['from'];
			if(options['executeFunction']) this.executeFunction = options['executeFunction'];
			if(options['loadExternal']) this.loadExternal = options['loadExternal'];

			if(this.close){
			$(this.content).addEvent('click',this.clearit.bindWithEvent(this));
			}

			if(options['effects']){
				this.effects = options['effects'];
			}else{
				this.effects = Fx.Transitions.linear;
			}
			this.content.setStyle('opacity','1');
			this.content.setStyle('visibility','hidden');
			this.content.setStyle('display','none'); // hide panel on page load
			$(this.content).setStyle('z-index','5000');
			$(this.toggler).addEvent('click',this.toggle.bindWithEvent(this));

		},

		clearit: function(){

			var myEffects = new Fx.Morph(this.content, {duration: this.fadeSpeed, transition: Fx.Transitions.linear});
			myEffects.start({
   				 'opacity': [1, 0]
			});;
					this.isOpen = 0;
					var p = new Function(this.executeFunction);
					p();

		},

		toggle: function(e){
			e = new Event(e).stop();
			var top =  window.getHeight().toInt() + window.getScrollTop().toInt();

			if(!this.isOpen){

				$(this.content).setStyle('position','absolute');
				$(this.content).setStyle('top',top);
				$(this.content).setStyle('height',this.height);
			    $(this.content).setStyle('visibility','visible');
			    $(this.content).setStyle('display','block');
				$(this.content).setStyle('opacity','1');
				$(this.content).setStyle('left','25%');

				var end;
				if(this.from == "top"){

				var myEffect = new Fx.Morph(this.content, {duration: this.slideSpeed, transition: this.effects});
				var totalEnd = end+this.height;

 				myEffect.start({
   				 'top': ['-200', '100']
				});

					this.isOpen = 1;
				}

			}else{
			var myEffects = new Fx.Morph(this.content, {duration: this.fadeSpeed, transition: Fx.Transitions.linear});
			myEffects.start({
   				 'opacity': [1, 0]
			});

				this.isOpen = 0;
				var p = new Function(this.executeFunction);
				p();
			}
		}
	})

mooSlide2.implement(new Options);
mooSlide2.implement(new Events);