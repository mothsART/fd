_fd() {
    local i cur prev opts cmds
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    cmd=""
    opts=""

    for i in ${COMP_WORDS[@]}
    do
        case "${i}" in
            fd)
                cmd="fd"
                ;;
            
            *)
                ;;
        esac
    done

    case "${cmd}" in
        fd)
            opts=" -H -I -u -s -i -F -a -L -p -0 -h -V -d -t -e -x -E -c -j -S  --hidden --no-ignore --no-ignore-vcs --case-sensitive --ignore-case --fixed-strings --absolute-path --follow --full-path --print0 --help --version --max-depth --type --extension --exec --exclude --ignore-file --color --threads --size --max-buffer-time  <pattern> <path>... "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
                return 0
            fi
            case "${prev}" in
                
                --max-depth)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                    -d)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                --type)
                    COMPREPLY=($(compgen -W "f file d directory l symlink x executable" -- ${cur}))
                    return 0
                    ;;
                    -t)
                    COMPREPLY=($(compgen -W "f file d directory l symlink x executable" -- ${cur}))
                    return 0
                    ;;
                --extension)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                    -e)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                --exec)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                    -x)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                --exclude)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                    -E)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                --ignore-file)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                --color)
                    COMPREPLY=($(compgen -W "never auto always" -- ${cur}))
                    return 0
                    ;;
                    -c)
                    COMPREPLY=($(compgen -W "never auto always" -- ${cur}))
                    return 0
                    ;;
                --threads)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                    -j)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                --size)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                    -S)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                --max-buffer-time)
                    COMPREPLY=($(compgen -f ${cur}))
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        
    esac
}

complete -F _fd -o bashdefault -o default fd
