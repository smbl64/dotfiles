if [ -z $1 ]; then
    echo "No package is specified"
    exit 1
fi


package_name=$1
info=$(brew info --json $package_name)

installed_version=$(echo $info | jq '.[0].installed[0].version')
new_version=$(echo $info | jq '.[0].versions.stable')

echo "$package_name: $installed_version -> $new_version"
