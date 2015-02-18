define({
  $plugins: ["wire/dom", "core/plugin/contextRouter"],
  appRouter: {
    contextRouter: {
      routes: {
        "form": {
          spec: "components/form/spec",
          slot: {
            $ref: "dom.first!#page"
          }
        },
        "lines": {
          spec: "components/lines/spec",
          slot: {
            $ref: "dom.first!#page"
          }
        }
      }
    }
  }
});
