var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

define(["underscore", "jquery", "core/utils/view/normalize", "radialIndicator"], function(_, $, normalize, radialIndicator) {
  var Indicator;
  return Indicator = (function() {
    function Indicator() {
      this.setPercents = __bind(this.setPercents, this);
    }

    Indicator.prototype.onReady = function() {
      this.view = normalize(this.view);
      this.element = this.view.find('#indicatorContainer');
      this.element.radialIndicator({
        barColor: '#87CEEB',
        barWidth: 10,
        initValue: 0,
        roundCorner: true,
        percentage: true
      });
      return this.indicatorObj = this.element.data('radialIndicator');
    };

    Indicator.prototype.setPercents = function(percents) {
      return this.indicatorObj.animate(80);
    };

    return Indicator;

  })();
});
