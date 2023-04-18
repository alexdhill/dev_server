UID=$(id -u)
GID=$(id -g)
PORT=$1
PROJDIR="$PWD"

echo "Running VSCode from $(basename $PROJDIR) on port $PORT"

if [[ -z "$1" ]]
    then
        echo "No port specified - using port 8443"
        PORT="8443"
fi

docker run --rm -dp $PORT:8443 \
    --name "$(basename "$PROJDIR")-vsc" \
    -e PUID="$UID" \
    -e GUID="$GID" \
    -v "$PROJDIR":/workspace \
    -e DEFAULT_WORKSPACE=/workspace \
    -v ~/.gitconfig:/config/.gitconfig \
    alexdhill/vscode:devel
