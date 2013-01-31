def compile_less
    %x[lessc site/media/less/cheetah.less site/media/css/cheetah.css]
end

def minify_css
    %x[lessc site/media/less/cheetah.less site/media/css/cheetah.min.css --yui-compress]
end

def update_terminal(message)
  system "echo #{message}"
end

update_terminal "Watching folders and waiting for changes..."

watch('media/less/*') { |m|
    # Recompile LESS files
    compile_less
    minify_css
    update_terminal "LESS compiled and compressed"
}

