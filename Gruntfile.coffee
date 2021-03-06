connectMW = require(require("path").resolve("middleware", "connectMW.coffee"))

module.exports = (grunt) ->

    port = 7788
  
    # Project configuration.
    grunt.initConfig
        watch:
            coffee_app:
                files: ['app/coffee/**/**.coffee']
                tasks: ["coffee-compile-app"]
            js_requireConfig:
                files: ["app/js/requireConfig.js", "app/js/main.js"]
                tasks: ["concat:main"]
            js:
                files: ["app/js/**/**.js"]
                options:
                    livereload: true

        coffee:
            app:
                options: {
                    bare: true
                }
                files: [
                    expand: true
                    cwd: 'app/coffee'
                    src: ['**/*.coffee']
                    dest: 'app/js'
                    ext: '.js'
                ]

        connect:
            server:
                options:
                    port: port
                    base: '.'
                    middleware: (connect, options) ->
                        return [
                            connectMW.randomService
                            connectMW.folderMount(connect, options.base)
                        ]

        concat:
            main:
                src: ["app/js/requireConfig.js", "app/js/main.js"]
                dest: "app/js/supermain.js"

    grunt.loadNpmTasks "grunt-contrib-watch"
    grunt.loadNpmTasks "grunt-contrib-coffee"
    grunt.loadNpmTasks "grunt-contrib-connect"
    grunt.loadNpmTasks "grunt-contrib-concat"
    grunt.loadNpmTasks "grunt-newer"

    grunt.registerTask "default", ["connect:server", "watch"]

    # compilation
    grunt.registerTask "coffee-compile-app", ["newer:coffee:app"]

    grunt.registerTask "server", ["connect"]



