# Creating new releases

1. First make sure you have followed the [release process steps for releasing a new MKE binary.](https://mirantis.jira.com/wiki/spaces/BOP/pages/6269698131/Release+Checklist)
2. Once the MKE binary is released, we can update homebrew.
3. First create a PR updating `.github/development.env` if any dependency versions should be changed for the new release. Note k0sctl is not a dependency even though it is required for mkectl, this is because k0sctl brew formula is unfortunately not versioned. Merge the PR before proceeding so the actions can use the updated versions.
4. Navigate to the [actions tab ](https://github.com/Mirantis/homebrew-tap/actions/workflows/update-homebrew.yml), and manually run the workflow while providing the new version (i.e `4.0.1`) as an input. Note there should be no "v" in this version. This will create a PR with the updated formula.
5. If you updated dependencies in step 3, you may also need to update dependencies in the formula
6. Verify the tests have finished. There should be bottles output as artifacts from the tests - these are used in the following step.
7. Add the `pr-pull` label to the PR. This will run some final tests and merge the PR if successful.
