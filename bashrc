alias v='vim'

gac() {
    git add $1
    git commit $1 -m $2
}
