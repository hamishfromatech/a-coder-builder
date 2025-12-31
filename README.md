# A-Coder Builder

This is a fork of VSCodium, which has a nice build pipeline that we're using for A-Coder. Big thanks to the CodeStory team for inspiring this.

The purpose of this VSCodium fork is to run [Github Actions](https://github.com/hamishfromatech/a-coder-builder/actions). These actions build all the A-Coder assets (.dmg, .zip, etc), store these binaries on a release in [`hamishfromatech/a-coder-builder`](https://github.com/hamishfromatech/a-coder-builder/releases), and then set the latest version in a text file on [`hamishfromatech/versions`](https://github.com/hamishfromatech/versions) so A-Coder knows how to update to the latest version.

The  `.patch` files from VSCodium get rid of telemetry in A-Coder (the core purpose of VSCodium) and change VSCode's auto-update logic so updates are checked against `a-coder` and not `vscode` (we just had to swap out a few URLs). These changes described by the `.patch` files are applied to the code during the workflow run, and they're almost entirely straight from VSCodium, minus a few renames to A-Coder.

## Notes

- For an extensive list of all the places we edited inside of this VSCodium fork, search "A-Coder" and "hamishfromatech". We also deleted some workflows we're not using in this VSCodium fork (insider-* and stable-spearhead).

- The workflows that build A-Coder are located in `.github/workflows/`. We added some comments so you can understand what's going on. Almost all the code is straight from VSCodium.

- If you want to build and compile A-Coder yourself, you just need to fork this repo and run the GitHub Workflows. If you want to handle auto updates too, just search for caps-sensitive "A-Coder" and "hamishfromatech" and replace them with your own repo.

## Rebasing
- We often need to rebase `A-Coder` and `a-coder-builder` onto `vscode` and `vscodium` to keep our build pipeline working when deprecations happen, but this is pretty easy. All the changes we made are commented with the caps-sensitive word "Void" or "A-Coder" (except our images, which need to be done manually), so rebasing involves searching for these terms to re-make our changes. Just make sure the vscode and vscodium versions align.