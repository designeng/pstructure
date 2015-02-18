define [
    "underscore"
    "jquery"
    "core/utils/view/normalize"
    "radialIndicator"
], (_, $, normalize, radialIndicator) ->

    class Indicator

        onReady: ->
            @view = normalize @view
            @element = @view.find('#indicatorContainer')

            @element.radialIndicator
                barColor: '#87CEEB'
                barWidth: 10
                initValue: 0
                roundCorner : true
                percentage: true

            @indicatorObj = @element.data('radialIndicator')

        setPercents: (percents) =>
            @indicatorObj.animate(80)

