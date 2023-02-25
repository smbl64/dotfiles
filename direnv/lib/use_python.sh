# A helper function so direnv can use the proper Python from rtx
# In you .envrc file, use:
#
# use python x.y.z
# layout python
#
use_python() {
    local version=${1:-}
    echo "using python ${version}"
    PATH_add $(rtx where python@${version})/bin
}
