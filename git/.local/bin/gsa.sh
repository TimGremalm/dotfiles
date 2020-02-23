#!/bin/bash
#!/bin/sh
echo git stash apply stash@{$1}
git stash apply stash@{$1}

