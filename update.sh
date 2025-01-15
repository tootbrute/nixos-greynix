# add things to git
COMMIT_MSG="Update NixOS config."
echo "commit message?"
read COMMIT_MSG

echo "this is what they wrote: $COMMIT_MSG"

git add .
git commit -m "$COMMIT_MSG"
git push origin main
