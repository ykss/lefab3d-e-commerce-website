!function(factory) {

	if(typeof define === 'function' && define.amd) define(['index', 'jquery', 'jquery.ba-resize'], factory);
	else TabsAccordion = factory(Index, jQuery);
}
(function(Index, $) {

	var count = 0,
		namespace = 'tabsaccordion',
		$window = $(window),
		$html = $(document.documentElement).addClass('js'),
		$body = $(document.body);

	$.resize.throttleWindow = false;
	$.fn.TabsAccordion = function(options) {

		function T(element, options) {

			var idNamespace = namespace + '-' + count++,
				$element = $(element),
				$panels,
				$tabs,
				$tablist,
				$content,
				self = {
					version: '1.2.0',
					type: ($element.hasClass('accordion') && 'accordion') || ($element.hasClass('tabs') && 'tabs'),

					create: function() {

						$panels = $element.children();
						$tabs = $panels.children(':first-child');

						if(self.index) var prev = self.index.curr;
						(self.index = Index($panels.length - 1)).loop = true; // <- index looping for keyboard accessibility
						if(prev) self.index.set(prev);

						if(self.type === 'tabs') $element.prepend(($tabs = self.tabsCreateTablist($tabs).children()).end());

						$tablist = (self.type === 'tabs' ? $tabs.parent() : $element).attr('role', 'tablist');

						$tabs.attr({
							'id': function(index) {

								return this.id || idNamespace + '-tab-' + index;
							},
							'role': 'tab',
						});

						($content = $panels.map(function(index) {

							return $(this)
							.attr({
								'aria-labelledby': $tabs[index].id,
								'id': this.id || idNamespace + '-panel-' + index,
								'role': 'tabpanel',
							})
							.children()
							.slice(1)
							.wrapAll('<div><div></div></div>')
							.parent()
							.parent()
							.get();
						}))
						.each(self.collapse);

						$element
						.attr({
							'id': element.id || idNamespace,
							'tabindex': 0
						})
						.on('click.' + idNamespace, self.type === 'accordion' && '> * > :first-child' || '> :first-child > *', function(event) {

							self.goTo($tabs.index($(event.target).closest($tabs)));
						})
						.on('keydown.' + idNamespace, function(event) {

							// event.target should be the element and not a descendant 
							if(event.target !== element) return;

							var match = {
								37: 'prev',
								38: 'prev',
								39: 'next',
								40: 'next',
							}[event.keyCode];

							if(match) {

								event.preventDefault();
								
								self.goTo(self.index[match]);
							}
						})
						.on('resize.' + idNamespace, self.resize)
						.trigger('create');


						if(options.saveState) self.extensions.saveState(options.saveState);
						if(options.responsiveSwitch) self.extensions.responsiveSwitch(options.responsiveSwitch);
						if(options.hashWatch) self.extensions.hashWatch();
						if(options.pauseMedia) self.extensions.pauseMedia();

						if(typeof self.index.curr !== 'number') self.index.set(0);

						setTimeout(function() {

							$element.addClass('transition');
						})

						return self.expand(self.index.curr);
					},

					destroy: function(keepData) {

						if(self.type === 'tabs') {

							$element.height('auto');

							$tablist.remove();
						}
						else {

							$tabs
							.removeAttr('role')
							.filter('[id^="' + idNamespace + '"]').removeAttr('id');

							$tablist.removeAttr('role');
						}

						$panels
						.removeAttr('aria-expanded aria-labelledby role')
						.filter('[id^="' + idNamespace + '"]').removeAttr('id');

						$content
						.children()
						.children()
						.unwrap()
						.unwrap();

						if(!keepData)
						$element
						.removeData(namespace)
						.removeData('responsiveBreakpoint.' + idNamespace);

						$element
						.add([window, document.body])
						.off('.' + idNamespace)
						.end()
						.removeAttr('aria-activedescendant tabindex')
						.removeClass(self.type)
						.filter('[id^="' + idNamespace + '"]').removeAttr('id')
						.end()
						.trigger('destroy');

						return self;
					},

					resize: function() {

						if(self.type === 'tabs') $element.height($tablist.outerHeight() + $panels.eq(self.index.curr).outerHeight());
						else if(self.type === 'accordion' && $panels[self.index.curr].ariaExpanded)
						$content
						.eq(self.index.curr)
						.height($content.eq(self.index.curr).children().outerHeight());

						return self;
					},

					expand: function(index) {

						var $panel = $panels.eq(index).attr('aria-expanded', $panels[index].ariaExpanded = true);

						if(self.resize().type === 'tabs') $tabs.eq(index).addClass('current');

						$element
						.attr('aria-activedescendant', $panels[self.index.curr].id)
						.trigger('expand', [index, $panel]);

						return self;
					},

					collapse: function(index) {

						var $panel = $panels.eq(index).attr('aria-expanded', $panels[index].ariaExpanded = false);

						if(self.type === 'tabs') $tabs.eq(index).removeClass('current');
						else $content.eq(index).height(0);

						$element.trigger('collapse', [index, $panel]);

						return self;
					},

					goTo: function(index) {

						if(self.index.curr !== index && typeof self.index.curr === 'number') self.collapse(self.index.curr);
						self.index.set(index);

						return self[self.type === 'accordion' && $panels.eq(index).prop('ariaExpanded') ? 'collapse' : 'expand'](self.index.curr);
					},

					tabsCreateTablist: options.tabsCreateTablist || function(titles) {

						for(var i = 0, li = ''; i < titles.length; i++) li += '<li>' + titles[i].innerHTML + '</li>';

						return $('<ul>' + li + '</ul>');
					},

					extensions: {
						hashWatch: function() {

							var that = {
								changeHash: function(hash, $target) {

									var id = $target[0].id;

									$target[0].id = '';
									location.hash = hash;
									$target[0].id = id;

									return that;
								},

								expand: function(hash, event) {

									var $target = $element.find(hash);

									if($target.length) {

										var $panel = $target.closest($panels);

										if($panel.length) {

											if(event) event.preventDefault();

											self.goTo($panels.index($panel));
											that.changeHash(hash, $target);

											if(event)
											setTimeout(function() {

												$html
												.add($body)
												.animate({
													scrollTop: $target.offset().top,
												});
											},
											250);
										}
									}

									return that;
								},
							};

							$body
							// hash anchor activation
							.on('click.' + idNamespace, 'a[href^="#"]:not([href="#"])', function(event) {

								that.expand($(event.target).attr('href'), event);
							})
							// navigation e.g. back button
							.on('hashchange.' + idNamespace, function() {

								that.expand(location.hash);
							});

							return that.expand(location.hash);
						},

						saveStateLoaded: false,
						saveState: function(storage) {

							if(typeof storage !== 'object') return;

							var state = {
								remove: function() {

									storage.removeItem(idNamespace);
								},

								load: function() {

									var item = storage.getItem(idNamespace),
										data = JSON.parse(item);

									if(data && data.current) self.index.set(data.current);

									self.extensions.saveStateLoaded = true;
								},

								save: function() {

									storage.setItem(idNamespace, JSON.stringify({current: self.index.curr, expanded: $panels[self.index.curr].ariaExpanded}));
								},
							};

							// load only once per instance per page load
							if(!self.extensions.saveStateLoaded) state.load();

							$window.on('unload.' + idNamespace, state.save);

							return state;
						},

						responsiveSwitch: function(breakpoint) {

							if(breakpoint === 'tablist') {

								if(self.type === 'tabs') $element.data('responsiveBreakpoint.' + idNamespace, breakpoint = getTablistWidth());
								else breakpoint = $element.data('responsiveBreakpoint.' + idNamespace);
							}

							function getTablistWidth() {

								// measure combined width of all tabs instead of single width of tablist, because tabs are floated and can jump to the next line
								for(var i = 0, width = 0; i < $tabs.length; i++) width += $tabs.eq(i).outerWidth(true);

								return width;
							}

							function switchTo(type) {

								var current = self.index.curr,
									expanded = $panels[current].ariaExpanded;

								self.destroy(true);

								$element.addClass(self.type = type);

								self.index.set(current);
								self.create();

								$element.trigger('typechange', type);
							}

							function checkBreakpoint() {

								var type = $element.outerWidth() <= breakpoint ? 'accordion' : 'tabs';

								if(self.type !== type) switchTo(type);
							}

							$element.on('resize.' + idNamespace, checkBreakpoint);
						},

						pauseMedia: function() {

							if(typeof Modernizr === 'undefined' || !Modernizr.audio || !Modernizr.video || !$element.find('audio, video').length) return;

							$element.on('collapse.' + idNamespace, function(event, index, $panel) {

								$panel.find('audio, video').each(function() {

									this.pause();
								});
							});
						},
					},
				};

			return self.create();
		}

		var options = options || {},
			args = Array.prototype.slice.call(arguments, 1);

		return this.each(function(index) {

			var $this = $(this);

			// method call : instantiation
			return $this.data(namespace) ? $this.data(namespace)[options].apply(this, args) : $this.data(namespace, T(this, options));
		});
	}
});