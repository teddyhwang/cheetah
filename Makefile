PROJECTNAME = cheetah
MEDIA       = ./site/media/
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
	@sed -i '' "s/${PROJECTNAME}\.min\.css/${name}\.min\.css/" index.html
	@sed -i '' "s/${PROJECTNAME}/${name}/g" media/js/main.js
	@echo "Updating index.html and main.js...          ${CHECK} Done\n"
	@sed -i '' "s/${PROJECTNAME}/${name}/g" watchr.rb
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
	@sed "s/${PROJECTNAME}\.min\.css/${name}\.min\.css/" -i index.html
	@sed "s/${PROJECTNAME}/${name}/g" -i media/js/main.js
	@echo "Updating index.html and main.js...          ${CHECK} Done\n"
	@sed "s/${PROJECTNAME}/${name}/g" -i watchr.rb
	@echo "Updating watchr.rb file...                  ${CHECK} Done"
	@echo "\n${HR}"
	@echo "Project renamed to ${name} at ${DATE}."
	@echo "${DR}\n"

endif
