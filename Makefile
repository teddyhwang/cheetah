PROJECTNAME = cheetah
MEDIA       = ./media/
LESS        = ${MEDIA}less/${PROJECTNAME}.less
CSS         = ${MEDIA}css/${PROJECTNAME}.css
CSS_MIN     = ${MEDIA}css/${PROJECTNAME}.min.css
JS          = ${MEDIA}js/${PROJECTNAME}.js
JS_MIN      = ${MEDIA}js/${PROJECTNAME}.min.js
DATE        = $(shell date +%I:%M%p)
CHECK       = \033[32m✔\033[39m
HR          =-------------------------------------------------------
DR          ========================================================


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
	@yui-compressor ${CSS} > ${CSS_MIN}
	@echo "Minifying CSS ${PROJECTNAME}.less...        ${CHECK} Done"
	@uglifyjs2 ${JS} > ${JS_MIN}
	@echo "Minifying JS ${PROJECTNAME}.less...         ${CHECK} Done"
	@echo "\n${HR}"
	@echo "All assets successfully compiled at ${DATE}."
	@echo "${DR}\n"

#
# DEFINE
# Variables include: name
#

define:
	@echo "\n${DR}"
	@echo "Renaming project to ${name}..."
	@echo "${HR}\n"
	@sed "s/${PROJECTNAME}/${name}/" -i Makefile
	@echo "Updating Makefile project name...           ${CHECK} Done"
	@mv ${LESS} ${MEDIA}less/${name}.less
	@mv ${CSS} ${MEDIA}css/${name}.css
	@mv ${CSS_MIN} ${MEDIA}css/${name}.min.css
	@echo "Updating CSS and LESS file names...         ${CHECK} Done"
	@mv ${JS} ${MEDIA}js/${name}.js
	@mv ${JS_MIN} ${MEDIA}js/${name}.min.js
	@echo "Updating JS file names...                   ${CHECK} Done"
	@sed "s/${PROJECTNAME}\.min\.css/${name}\.min\.css/" -i index.html
	@sed "s/${PROJECTNAME}/${name}/g" -i media/js/main.js
	@echo "Updating index.html and main.js...          ${CHECK} Done"
	@sed "s/${PROJECTNAME}/${name}/g" -i watchr.rb
	@echo "Updating watchr.rb file...                  ${CHECK} Done"
	@echo "\n${HR}"
	@echo "Project renamed to ${name} at ${DATE}."
	@echo "${DR}\n"
