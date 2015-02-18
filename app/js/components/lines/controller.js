define(["underscore", "jquery", "kefir", "KefirJQuery", "core/utils/view/normalize"], function(_, $, Kefir, KefirJQuery, normalize) {
  var Controller;
  return Controller = (function() {
    function Controller() {
      var stream, transformer;
      KefirJQuery.init(Kefir, $);
      this.element = $("#page");
      transformer = function() {
        return $(this).find(".rect").css("width");
      };
      stream = this.element.asKefirStream("change", transformer).onValue(function(value) {
        return console.log("VALUE:::", value);
      });
      stream.log();
      this.element.trigger("change");
    }

    Controller.prototype.onReady = function() {
      var _this = this;
      console.debug("@indicator:::::", this.indicator);
      return setTimeout(function() {
        return _this.indicator.setPercents(80);
      }, 1000);
    };

    return Controller;

  })();
});
