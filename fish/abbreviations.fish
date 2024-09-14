function _expand_run -d "Expand the 'run' abbreviation into a project-specific run command.";
    if test -e Justfile;
        echo just run
    end
end

abbr --add run --function _expand_run;
