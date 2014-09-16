var gulp = require("gulp"),
    concat = require("gulp-concat"),
    uglify = require("gulp-uglify"),
    traceur = require("gulp-traceur"),
    sass = require("gulp-sass"),
    connect = require("gulp-connect"),
    gulpif = require("gulp-if"),

    files = {
      js: [
        "bower_components/traceur-runtime/traceur-runtime.js",
        "bower_components/es6-module-loader/dist/es6-module-loader.js",
        "bower_components/jquery/jquery.js",
        "bower_components/lodash/dist/lodash.js",
        "bower_components/angular/angular.js",
        "bower_components/angular-resource/angular-resource.js",
        "bower_components/angular-route/angular-route.js",
        "scripts/**/*.js",
      ],
      scss: ["scss/**/*.scss"]
    };
