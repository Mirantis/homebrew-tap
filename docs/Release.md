# Creating new releases

1. First make sure you have followed the [release process steps for releasing a new MKE binary.](https://github.com/MirantisContainers/mke/blob/main/docs/dev/creating-a-release.md)
2. Once the MKE binary is released, we can update homebrew.
3. First create a PR updating `.github/development.env` if any dependency versions should be changed for the new release. Merge the PR before proceeding so the actions can use the updated versions.
4. Navigate to the [actions tab ](https://github.com/Mirantis/homebrew-tap/actions/workflows/update-homebrew.yml), and manually run the workflow while providing the new version (i.e `v4.0.1`) as an input. This will create a PR with the updated formula.
5. Once satisfied with the changes, add the `bottle` label to the PR. This will trigger the bottle action which will build and publish the bottles. Additionally, it will update the PR with the bottle SHAs.
6. Verify the bottles are published. Once the bottles are published, add the `pr-pull` label to the PR. This will run some final tests and merge the PR if successful.