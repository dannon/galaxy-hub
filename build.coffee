# Build with Metalsmith
metalsmith = require('metalsmith')

# Plugin for Bower support
bower = (files, metalsmith, done) ->
    bower_files = require( 'bower-files' )()
    { readFileSync } = require 'fs'
    { basename } = require 'path'
    include = (root, included) ->
        for file in included
            contents = readFileSync(file)
            files["#{root}/#{basename(file)}"] =
                contents: contents
    include('css', bower_files.self().ext('css').files)
    include('js', bower_files.self().ext('js').files)
    include('fonts', bower_files.self().ext(['eot','otf','ttf','woff','woff2']).files)
    done()

link_to_orig_path = (files, metalsmith, done) ->
    for k, v of files
        files[k].orig_path = k
    done()

apply_directory_templates = (files, metalsmith, done) ->
    # Simple way to apply domain templates en masse
    minimatch = require('minimatch')
    for k, v of files
        if minimatch k, 'events/*/index.md'
            files[k].layout = 'events.pug'
    done()


fs = require('fs')
path = require('path')

hb_partials = require("handlebars")

partials_from_dir = (source, dir) ->
    for i, p_f of fs.readdirSync source
        p_path = path.join(source, p_f)
        stats = fs.statSync(p_path)
        if stats.isDirectory()
            partials_from_dir(p_path, dir)
        else
            contents = fs.readFileSync(p_path, 'utf8')
            p_path = p_path.replace("partials/", "").replace(".html", "")
            dir[p_path] = contents
            hb_partials.registerPartial(p_path, contents)
partials = {}
partials_from_dir('partials', partials)

md_link_pattern = /\[([^\]]*)\]\(([^\)]*)\)/g
html_link_pattern = /href=[\'"]?([^\'" >]+)[\'"]/g
html_img_pattern = /src=[\'"]\/src?([^\'" >]+)[\'"]/g

handlebars_partial_handling = (files, metalsmith, done) ->
    for file, c of files
        do (file, c) ->
            if file.endsWith('.md')
                contents = files[file].contents.toString()
                template = hb_partials.compile(contents)
                contents = template({})
                files[file].contents = contents
    done()

subs = (files, metalsmith, done) ->
    # Quick hack to temporarily handle INCLUDE migration
    # Followed by another set of hacks to strip /src and index.md out of
    # source.  We have these full references in the source to make GitHub
    # render correctly in the preview and web editor.  TODO:  Come up with a
    # better long term solution that renders both in github, and correctly for
    # publishing, that isn't a big nest of regexes and special cases.
    for file, c of files
        do (file, c) ->
            if file.endsWith('.md')
                contents = files[file].contents.toString()
                matches = []
                matches.push(match) while match = md_link_pattern.exec(contents)
                for match in matches
                    rep = match[2]
                    #TODO: Do this with a regex too
                    if rep.startsWith('/src')
                        # Drop leading /src
                        rep = rep.substr(4)
                    if rep.startsWith('/')
                        # If it's a local URL, drop index.md's when they exist.
                        # Replace is simpler here because we have to consider
                        # in-page anchors.
                        rep = rep.replace('index.md', '')
                    contents = contents.split(match[0]).join("["+match[1]+"]("+rep+")")
                matches = []
                matches.push(match) while match = html_link_pattern.exec(contents)
                for match in matches
                    rep = match[1]
                    if rep.startsWith('/src')
                        rep = rep.substr(4)
                    if rep.startsWith('/')
                        rep = rep.replace('index.md', '')
                    contents = contents.split(match[0]).join('href="'+rep+'"')
                matches = []
                matches.push(match) while match = html_img_pattern.exec(contents)
                for match in matches
                    # Simply match and drop leading /src/ from images.
                    contents = contents.split(match[0]).join('src="'+match[1]+'"')
                files[file].contents = contents
    done()

# Extend `marked.Renderer` to increase all heading levels by 1 since we reserve
# h1 for the page title. Will be passed to `metalsmith-markdown` plugin.
marked = require("marked")
class Renderer extends marked.Renderer
    heading: ( text, level, raw ) =>
        super( text, level + 1, raw )

timer = require( "metalsmith-timer" )

ms = metalsmith(__dirname)
    .use require('metalsmith-metadata')
        menu: "config/menu.yaml"
    .use timer 'metalsmith-metadata'
    .use require('metalsmith-collections')
        news:
            pattern: "news/*/*.md"
            sortBy: "date"
            reverse: true
        events:
            pattern: "events/*/*.md"
            sortBy: "date"
            reverse: true
        publications:
            pattern: "publications/*/*.md"
            sortBy: "date"
            reverse: true
    .use timer 'metalsmith-collections'
    .use link_to_orig_path
    .use apply_directory_templates
    .use timer 'link_to_orig_path'
    .use handlebars_partial_handling
    .use timer 'handlebars_partial_handling'
    .use subs
    .use timer 'subs'
    .use require('metalsmith-markdown')
        gfm: true
        renderer: new Renderer()
    .use timer 'metalsmith-markdown'
    .use require('metalsmith-autotoc')
        selector: "h2, h3, h4"
    .use timer 'metalsmith-autotoc'
    .use require('metalsmith-alias')()
    .use timer 'metalsmith-alias'
    .use require('metalsmith-filepath')
        absolute: true
        permalinks: true
    .use timer 'metalsmith-filepath'
    .use require('metalsmith-layouts')
        engine: "pug"
        cache: true
        default: "default.pug"
        pattern: "**/*.html"
        helpers:
            moment: require('moment')
            marked: require('marked')
            _: require('lodash')
    .use timer 'metalsmith-layouts'
    .use require('metalsmith-less')()
    .use timer 'metalsmith-less'
    .use bower
    .use timer 'bower'
    .use require('metalsmith-uglify')()
    .use timer 'metalsmith-uglify'

argv = require('minimist')(process.argv.slice(2))

if argv['serve']
    ms.use( require('metalsmith-serve')( { port: 8080 } ) )

if argv['check']
    ms.use require('metalsmith-broken-link-checker')
        allowRedirects: true
        warn: true

ms.build (e) ->
    if e
        throw e
    else
        console.log("Done")
