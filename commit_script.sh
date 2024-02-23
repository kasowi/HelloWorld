ls -R

git config --global user.email "katharinawin@outlook.com"
git config --global user.name "kasowi"

mkdir ~/.ssh
echo "$SSH_KEY" > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa

curl https://github.com/users/kasowi/contributions?to=$(date +"%Y")-12-31 | grep data-date=\"$(date +"%Y-%m-%d")\" > counts
cat counts

python commit.py