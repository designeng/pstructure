define [
    "underscore"
    "jquery"
    "kefir"
    "KefirJQuery"
    "core/utils/view/normalize"
], (_, $, Kefir, KefirJQuery, normalize) ->

    class Controller

        constructor: ->
            KefirJQuery.init(Kefir, $)

            @element = $("#page")

            transformer = () ->
                return $(@).find(".rect").css "width"

            stream = @element.asKefirStream("change", transformer)
                .onValue (value) -> 
                    console.log "VALUE:::", value

            stream.log()

            @element.trigger "change"

        onReady: ->

            console.debug "@indicator:::::", @indicator

            setTimeout () =>
                @indicator.setPercents(80)
            , 1000

