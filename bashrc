alias v='vim'


gac() {
    files=$1
    echo $files
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
    echo $files
    echo $files -m "$params"
}
