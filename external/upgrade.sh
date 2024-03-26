#!/bin/bash
set -o pipefail

# $1 ... source url
get_latest_tag()
{
    curl -s -X GET "${1}/tags.atom" \
        | grep "<id>tag" \
        | head -2 | tail -1 \
        | sed -rn "s|.*/v?(.*)</id>.*|\1|gp"
}

# $1 ... filename
# $2 ... version
get_package_hash()
{
    local filename=
    local version=
    local pkg_url=

    filename=$1
    version=$2

    pkg_url=$(grep " URL " "${filename}" | sed "s|^.*URL \(.*\)$|\1|g")
    pkg_url="${pkg_url//\$\{EXT_VERSION\}/${version}}"

    curl -skLS "${pkg_url}" | sha256sum | cut -d " " -f 1
}


# $1 ... filename
# $2 ... current version
# $3 ... current hash
# $4 ... new version
update_file()
{
    local filename=
    local old_version=
    local old_hash=
    local new_version=
    local new_hash=

    filename=$1
    old_version=$2
    old_hash=$3
    new_version=$4

    if [[ "${old_hash}" != "" ]]; then
        new_hash=$(get_package_hash "${filename}" "${new_version}")
        if [[ $? -ne 0 ]]; then
            echo "failed to retrieve package hash"
            return 1
        fi
    fi

    sed -i "s|EXT_VERSION \"${old_version}\"|EXT_VERSION \"${new_version}\"|g" "${filename}"

    if [[ "${old_hash}" == "" ]]; then
        return 0
    fi

    sed -i "s|EXT_URL_HASH \"SHA256=${old_hash}\"|EXT_URL_HASH \"SHA256=${new_hash}\"|g" "${filename}"
}

# $1 ... file name
process_file()
{
    local filename=
    local source=
    local version=
    local hash=

    filename=$1

    source=$(grep "# source:" "${filename}" | sed "s/# source: \(.*\)/\1/g")
    if [[ "${source}" == "" ]]; then
        echo "${filename}: no source tag"
        return 1
    fi

    version=$(grep "set(EXT_VERSION" "${filename}" | sed "s/^.*\"\(.*\)\".*$/\1/g")
    if [[ "${version}" == "" ]]; then
        echo "${filename}: no version"
        return 1
    fi
    if [[ "${version}" == "master" || "${version}" == "main" ]]; then
        echo "${filename}: not tag"
        return 1
    fi

    hash=$(grep "set(EXT_URL_HASH" "${filename}" | sed "s/.*\"SHA256=\(.*\)\".*/\1/g")

    new_version=$(get_latest_tag "${source}")

    if [[ "${version}" == "${new_version}" ]]; then
        echo "${filename}: no change"
        return 0
    fi

    echo "${filename}:  ${version} / ${new_version}"

    while true; do
        read -rp "update [y/N] " update
        case ${update,,} in
            y | yes)
                update_file "${filename}" "${version}" "${hash}" "${new_version}"
                return $?
                ;;
            n | no)
                return 0
                ;;
            *)
                ;;
        esac
    done

    return 1
}

process_files()
{
    local pattern=
    pattern="ext_*.cmake"

    for file in ${pattern}; do
        process_file "${file}"
    done
}

if [[ "$1" == "" ]]; then
    process_files
else
    process_file "$1"
fi
