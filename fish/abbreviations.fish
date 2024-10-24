function _expand_run -d "Expand the 'run' abbreviation into a project-specific run command.";
    if test -e Justfile;
        echo just run
    end
end

function _expand_test -d "Expand the 'test' abbreviation into a project-specific test command.";
    if test -e Justfile;
        echo just test
    end
end

abbr --add run --function _expand_run;
abbr --add test --function _expand_test;
