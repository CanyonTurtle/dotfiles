alias v='vim'


gac() {
    files=$1
    params=
    while [ "$2" != "" ]; do
        case $2 in
            -m )
                shift
                while [ "$2" != "" ]; do
                    params="$params $2"
                    shift
                done
             ;;
        esac
        shift
    done
    echo "trying to do add $files commit $files -m $params"
    git add $files
    git commit $files -m "$params"
}
