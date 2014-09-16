var gulp = require("gulp"),
    concat = require("gulp-concat"),
    uglify = require("gulp-uglify"),
    traceur = require("gulp-traceur"),
    sass = require("gulp-sass"),
    connect = require("gulp-connect"),
    gulpif = require("gulp-if"),

    env = process.env.NODE_ENV || "development",

    files = {
      js: [
        "bower_components/traceur/traceur.js",
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

gulp.task("connect", function () {
  connect.server({
    root: ".",
    livereload: true
  });
});

gulp.task("js", function () {
  return gulp.src(files.js)
    .pipe(traceur({
      modules: "instantiate"
    }))
    .pipe(gulpif(env === "production", uglify()))
    .pipe(concat("app.js"))
    .pipe(gulp.dest("dist/"))
    .pipe(connect.reload());
});

gulp.task("scss", function () {
  return gulp.src(files.scss)
    .pipe(sass())
    .pipe(concat("app.css"))
    .pipe(gulp.dest("dist/app.css"))
    .pipe(connect.reload());
});

gulp.task("watch", function () {
  gulp.watch(files.js, ["js"]);
  gulp.watch(files.scss, ["scss"]);
});

gulp.task("default", ["connect", "watch"]);
