## Git

Tutorial git : https://learngitbranching.js.org/index.html


##### Merge origin/master to current branch :
- git fetch origin
- git merge origin/master


##### Branches :
- `git checkout -b [name_of_your_new_branch]` : Create the branch on your local machine and switch in this branch
- `git checkout [name_of_branch]` : Change working branch
- `git push origin [name_of_your_branch]` : Push the branch
- `git remote add [name_of_your_remote] [name_of_your_branch]` : Add a new remote for your branch
- `git branch -d [name_of_your_new_branch]` : Delete a branch on your local filesystem


##### Annuler un commit :
- `git reset --soft HEAD^` : Le dernier, en gardant les modif en local
- `git revert 42xxxxxxxxx` : Appliquer le commit inverse


##### Stash :
- `git stash list` : Liste tous les stash existant
- `git stash push -m "message"` : Stash tous les fichiers modifiés dans un nouveau stash
- `git stash push -m "message" -- path/to/file/to/include` : the path must be relative to the repository root, not to your current working dir.
- `git stash apply $stash_id` : Applique le stash en le gardant
- `git stash pop $stash_id` : Applique le stash et le supprime
- `git stash drop $stash_id` : supprime le stash
