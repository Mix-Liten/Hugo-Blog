TODAY="$(date '+%Y-%m-%d')"
YYYY=$(date '+%Y')
MM=$(date '+%m')
# DD=$(date '+%d')

read -p "Input New Post Name: " POSTNAME

if ! command -v hugo &> /dev/null
then
    echo "hugo command could not be found"
    exit
fi

BASIC="posts/${YYYY}/${MM}/${POSTNAME}.md"
FULL="posts/${YYYY}/${MM}/${TODAY}-${POSTNAME}.md"

hugo new $BASIC

mv "${PWD}/content/${BASIC}" "${PWD}/content/${FULL}"
