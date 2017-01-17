function fish_prompt_breadcrumb -a action func
    if [ (count $argv) -eq 0 ]
        echo "fish_prompt_breadcrumb <remove | add | list> <function name>"
        return 1
    else
        switch $action
            case r rm remove
                if contains $func $__fish_prompt_crumbs
                    set pa_index (contains -i -- $func $__fish_prompt_crumbs)
                    set -e __fish_prompt_crumbs[$pa_index]
                else 
                    return 1
                end
            case a add
                if not contains $func $__fish_prompt_crumbs
                    set -g __fish_prompt_crumbs $__fish_prompt_crumbs $func
                end
            case l list
                echo $__fish_prompt_crumbs' : '
        end
    end
end

