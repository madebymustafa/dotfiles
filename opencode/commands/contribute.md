---
description: Contribute to an upstream repo under the user's own GitHub identity
---

Contribute a change to an open-source repo so the user gets the credit.

Follow the global **Contributions** and **Writing quality** rules throughout.

1. Ask the user which repo and what change they want; if they paste a URL, extract the owner and repo.
2. Fork under the user's account if missing: `gh repo fork <owner>/<repo>`. Clone the fork, then add `upstream` pointing at the original repo.
3. Create a descriptive branch off the mainline, e.g. `fix/tab-rename-dialog`.
4. Set the repo-local git identity to the user's identity before any commit: `git config user.name madebymustafa` and `git config user.email hi.mustafa@icloud.com`. Confirm with `git config user.email`.
5. Make the change, following the global planning, test, and review rules.
6. Draft the commit message: subject in the repo's existing format, body that explains the change in plain words. Humanize it with the **humanizer** skill (embedded mode).
7. Commit, then verify attribution with `git log -1 --format="%an <%ae>"`.
8. Push the branch to the fork.
9. Draft the PR title and body, humanize them, show the user for approval, then open with `gh pr create` from the fork. Link the issue the change fixes if there is one.
10. Report the PR URL. Do not close the loop until attribution is confirmed: the PR author must be `madebymustafa`, not a bot.