PROJECTNAME = cheetah
MEDIA       = ./site/media/

LIB         = ${MEDIA}lib/
SRC         = ./src/components/

LESS        = ${MEDIA}less/${PROJECTNAME}.less

CSS         = ${MEDIA}css/${PROJECTNAME}.css
CSS_MIN     = ${MEDIA}css/${PROJECTNAME}.min.css

JS          = ${MEDIA}js/${PROJECTNAME}.js
JS_MIN      = ${MEDIA}js/${PROJECTNAME}.min.js

DATE        = $(shell date +%I:%M%p)

CHECK       = \033[32m✔\033[39m

HR          =-------------------------------------------------------
DR          ========================================================


PLATFORM    = $(shell uname)


#
# BUILD
#
#

copy:
	@echo
	@echo "\n${DR}"
	@echo "Copying assets..."
	@echo "${HR}\n"
	@cp -f ${SRC}backbone/backbone* ${LIB}backbone/.
	@echo "Copying backbone...    ${CHECK} Done"
	@cp -f ${SRC}bootstrap/docs/assets/css/bootstrap* ${LIB}bootstrap/css/.
	@cp -f ${SRC}bootstrap/docs/assets/js/bootstrap.* ${LIB}bootstrap/js/.
	@cp -f ${SRC}bootstrap/less/mixins.* ${LIB}bootstrap/less/.
	@cp -f ${SRC}bootstrap/less/variables.* ${LIB}bootstrap/less/.
	@cp -f ${SRC}bootstrap/docs/assets/img/glyphicons* ${MEDIA}img/.
	@echo "Copying bootstrap...   ${CHECK} Done"
	@cp -f ${SRC}handlebars/handlebars* ${LIB}handlebars/.
	@echo "Copying handlebars...  ${CHECK} Done"
	@cp -f ${SRC}jquery/jquery* ${LIB}jquery/.
	@echo "Copying jquery...      ${CHECK} Done"
	@cp -f ${SRC}modernizr/modernizr* ${LIB}modernizr/.
	@echo "Copying modernizr...   ${CHECK} Done"
	@cp -f ${SRC}requirejs/require* ${LIB}requirejs/.
	@echo "Copying requirejs...   ${CHECK} Done"
	@cp -f ${SRC}underscore/underscore* ${LIB}underscore/.
	@echo "Copying underscore...  ${CHECK} Done"
	@echo "\n${HR}"
	@echo "All assets successfully copied at ${DATE}."
	@echo "${DR}\n"


#
# COMPILE
# requires uglifyjs2, lessc and yui-compressor
#

compile:
	@echo "\n${DR}"
	@echo "Compiling scripts..."
	@echo "${HR}\n"
	@lessc ${LESS} > ${CSS}
	@echo "Compile LESS file ${PROJECTNAME}.less...    ${CHECK} Done"
	@lessc ${LESS} > ${CSS_MIN} --yui-compress
	@echo "Minifying CSS ${PROJECTNAME}.less...        ${CHECK} Done"
	@uglifyjs ${JS} > ${JS_MIN}
	@echo "Minifying JS ${PROJECTNAME}.js...           ${CHECK} Done"
	@echo "\n${HR}"
	@echo "All assets successfully compiled at ${DATE}."
	@echo "${DR}\n"


#
# DEFINE
# Variables include: name; `make define name=foo`
#

# Dirty way to separate this between Mac (Darwin) and Linux
# since `sed` command is executed differently
# TODO: find a cleaner solution

ifeq ($(PLATFORM), Darwin)

define:
	@echo "\n${DR}"
	@echo "Renaming cheetah to ${name}..."
	@echo "${HR}\n"
	@sed -i '' "s/${PROJECTNAME}/${name}/" Makefile
	@echo "Updating Makefile cheetah name...           ${CHECK} Done"
	@mv ${LESS} ${MEDIA}less/${name}.less
	@mv ${CSS} ${MEDIA}css/${name}.css
	@mv ${CSS_MIN} ${MEDIA}css/${name}.min.css
	@echo "Updating CSS and LESS file names...         ${CHECK} Done\n"
	@mv ${JS} ${MEDIA}js/${name}.js
	@mv ${JS_MIN} ${MEDIA}js/${name}.min.js
	@echo "Updating JS file names...                   ${CHECK} Done"
	@sed -i '' "s/${PROJECTNAME}\.min\.css/${name}\.min\.css/" site/index.html
	@sed -i '' "s/${PROJECTNAME}/${name}/g" site/media/js/main.js
	@echo "Updating index.html and main.js...          ${CHECK} Done\n"
	@sed -i '' "s/${PROJECTNAME}/${name}/g" less_watchr.rb
	@echo "Updating watchr.rb file...                  ${CHECK} Done"
	@echo "\n${HR}"
	@echo "Project renamed to ${name} at ${DATE}."
	@echo "${DR}\n"

else

define:
	@echo "\n${DR}"
	@echo "Renaming cheetah to ${name}..."
	@echo "${HR}\n"
	@sed "s/${PROJECTNAME}/${name}/" -i Makefile
	@echo "Updating Makefile cheetah name...           ${CHECK} Done"
	@mv ${LESS} ${MEDIA}less/${name}.less
	@mv ${CSS} ${MEDIA}css/${name}.css
	@mv ${CSS_MIN} ${MEDIA}css/${name}.min.css
	@echo "Updating CSS and LESS file names...         ${CHECK} Done\n"
	@mv ${JS} ${MEDIA}js/${name}.js
	@mv ${JS_MIN} ${MEDIA}js/${name}.min.js
	@echo "Updating JS file names...                   ${CHECK} Done"
	@sed "s/${PROJECTNAME}\.min\.css/${name}\.min\.css/" -i site/index.html
	@sed "s/${PROJECTNAME}/${name}/g" -i site/media/js/main.js
	@echo "Updating index.html and main.js...          ${CHECK} Done\n"
	@sed "s/${PROJECTNAME}/${name}/g" -i less_watchr.rb
	@echo "Updating watchr.rb file...                  ${CHECK} Done"
	@echo "\n${HR}"
	@echo "Project renamed to ${name} at ${DATE}."
	@echo "${DR}\n"

endif


#
# Remove
# Variables include: package; `make uninstall package=foo`
#

remove:
	@rm -rf site/media/lib/${package}
	@echo "${package} removed at ${DATE}."


#
# UNINSTALL
# Apply this when you have all the packages you want and want to remove this
# Makefile and all the other junk
#

uninstall:
	@rm -rf ./src
	@rm -rf ./Makefile
	@rm -rf ./less_watchr.rb
	@echo "Cheetah cleaned up and uninstalled"

