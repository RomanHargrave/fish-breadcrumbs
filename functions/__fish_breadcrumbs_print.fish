function __fish_breadcrumbs_print -a seperator
    if [ (count $seperator) -eq 0 ]
        set seperator (set_color 444)' : '
    end

    if set -q __fish_prompt_crumbs
        for func in $__fish_prompt_crumbs
            set_color normal
            eval $func
            printf $seperator
        end
    end
end
