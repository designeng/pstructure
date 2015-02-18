define({
  $plugins: ["wire/debug", "wire/dom", "wire/dom/render", "wire/on"],
  linesView: {
    render: {
      template: {
        module: "text!components/lines/template.html"
      }
    },
    insert: {
      at: {
        $ref: 'slot'
      }
    }
  },
  indicator: {
    create: "components/lines/indicator",
    properties: {
      view: {
        $ref: 'linesView'
      }
    },
    ready: {
      onReady: {}
    }
  },
  controller: {
    create: "components/lines/controller",
    properties: {
      view: {
        $ref: 'linesView'
      },
      indicator: {
        $ref: 'indicator'
      }
    },
    ready: {
      onReady: {}
    }
  }
});
