module.exports = function(grunt) {

  grunt.initConfig({
    pkg: grunt.file.readJSON( 'package.json' ),

    watch: {
      scss: {
        files: ['assets/scss/**.scss'],
        tasks: 'scss',
        options: {
          interrupt: true
        }
      },
      assets: {
        files: ['assets/fonts/**', 'assets/images/**'],
        tasks: 'assets',
        options: {
          interrupt: true
        }
      },
      js: {
        files: ['assets/js/**.js'],
        tasks: 'js'
      },
      livereload: {
        options: {
          livereload: true
        },
        files: [
          'public/**.html',
          'public/assets/css/**.css',
          'public/assets/js/**.js'
        ]
      }
    },

    sass: {
      build: {
        files: [
          {
            src: ['*.scss', '!**/_*.scss'],
            cwd: 'assets/scss',
            dest: 'tmp',
            ext: '.css',
            expand: true
          }
        ],
        options: {
          style: 'compressed'
        }
      }
    },

    // https://github.com/nDmitry/grunt-autoprefixer
    autoprefixer: {
      build: {
        options: {
          browsers: ['last 2 versions', '> 1%']
        },
        files: [
          {
            src : ['*.css'],
            cwd : 'tmp',
            dest : 'public/assets/css',
            ext : '.css',
            expand : true
          }
        ]
      }
    },

    connect: {
      server: {
        options: {
          port: 8000,
          base: './public'
        }
      }
    },

    copy: {
      fonts: {
        files: [
          { expand: true, cwd: './assets/fonts', src: ['./**/*.*'], dest: 'public/assets/fonts' }
        ]
      },
      images: {
        files: [
          { expand: true, cwd: './assets/images', src: ['./**/*.*'], dest: 'public/assets/images' }
        ]
      },
      js: {
        files: [
          { expand: true, cwd: './assets/js', src: ['./**/*.*'], dest: 'public/assets/js' }
        ]
      }
    }

  });

  // Default task
  grunt.registerTask('default', ['sass', 'autoprefixer', 'assemble', 'copy']);

  grunt.registerTask('scss', ['sass', 'autoprefixer']);
  // grunt.registerTask('html', ['assemble']);
  grunt.registerTask('js', ['copy:js']);
  grunt.registerTask('assets', ['copy:fonts', 'copy:images']);

  grunt.registerTask('dev', ['connect', 'watch']);
  // grunt.registerTask('deploy', ['gh-pages']);

  // grunt.loadNpmTasks('assemble');
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);
};
