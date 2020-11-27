function va
    set pattern $argv[1]
    if test (count $argv) -gt 1
        set argv $argv[2..-1]
    else
        set argv
    end

    function to_safe
        sed -E -e 's/[\\][=]/__EQ__/g' -e 's/[\\][<]/__LT__/g' -e 's/[\\][>]/__GT__/g'
    end

    function to_unsafe_rg
        sed -E -e 's/__LT__/</g' -e 's/__GT__/>/g' -e 's/__EQ__/=/g'
    end

    function to_unsafe_vim
        sed -E -e 's/__LT__/[<]/g' -e 's/__GT__/[>]/g' -e 's/__EQ__/[=]/g'
    end

    set ag_pattern (echo $pattern | to_safe | sed -E -e 's/[<>]/\\\\b/g' | to_unsafe_rg)
    set vim_pattern (echo $pattern | to_safe | sed -E -e 's,([/=]),\\\\\1,g' -e 's,.*,/\\\\v&,' | to_unsafe_vim)
    ag -l --smart-case --null $ag_pattern -- $argv 2>/dev/null | xargs -0 -o nvim -c $vim_pattern
end
