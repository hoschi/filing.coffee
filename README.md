# filing.coffee

Filing.coffee is a simple node application to manage your filing.

# dev environment

* install the node (use nave if you want) version specified in package.json
* install nodemon@0.6.9 for auto restart filing.coffee
* install dependcies with "npm install"
* install mongodb
* (switch connection strings in filing.coffee)
* symlink or copy an unzipped extjs 4.1 dir into public/js/ext
* compile coffee scripts with "coffee -cw public/js/app"
* gogogogo

# todo

* don't insert files with same id
* get next free ID with button
* add description
* add "last recent updated" files view
* add client search for files
* use connect-assets instead of manual compilation

# done

* list files
* delete one file
* add a file
* make file list sortable
* auto update ID when adding a file
* add created and updated dates to a file automagically
