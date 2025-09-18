# Creating new releases

1. First make sure you have followed the [release process steps for releasing a new MKE binary.](https://github.com/MirantisContainers/mke/blob/main/docs/dev/creating-a-release.md)
2. Once the MKE binary is released, we can update homebrew.
3. Navigate to the [actions tab ](https://github.com/Mirantis/homebrew-tap/actions/workflows/update-homebrew.yml), and manually run the workflow while providing the new version (i.e `4.0.1`) as an input. Note there should be no "v" in this version. This will create a PR with the updated formula.
4. Verify the tests have finished. There should be bottles output as artifacts from the tests - these are used in the following step.
5. Add the `pr-pull` label to the PR. This will run some final tests and merge the PR if successful.
