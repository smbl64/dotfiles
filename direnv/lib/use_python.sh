# A helper function so direnv can use the proper Python from mise
# In you .envrc file, use:
#
# use python x.y.z
# layout python
#
use_python() {
    local version=${1:-}
    echo "using python ${version}"
    PATH_add $(mise where python@${version})/bin
}
