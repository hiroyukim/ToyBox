if whoami == "root"
then
    exit 1
fi

user_name=$1
user_email=$2

git config --global user.name $user_name
git config --global user.email $user_email
git config core.editor vim
git config core.pager  less
