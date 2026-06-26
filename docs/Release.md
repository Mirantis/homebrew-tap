# Creating new releases

1. First make sure you have followed the [release process steps for releasing a new MKE binary.](https://mirantis.jira.com/wiki/spaces/BOP/pages/6269698131/Release+Checklist)
2. Once the MKE binary is released, we can update homebrew.
3. Navigate to the [actions tab ](https://github.com/Mirantis/homebrew-tap/actions/workflows/update-homebrew.yml), and manually run the workflow while providing the new version (i.e `4.0.1`) as an input. Note there should be no "v" in this version. This will create a PR with the updated formula.
4. The test workflow on the new PR may not start on its own — GitHub can hold it pending approval (you will see **"1 workflow awaiting approval"** on the PR or the Actions tab). If so, open it and click **Approve and run** so the tests can run.
5. Verify the tests have finished. There should be bottles output as artifacts from the tests - these are used in the following step.

   > **Note:** The `bottle do` block (the `root_url` and `sha256` lines) in the PR will still reference the previous release and **is not updated by this PR**. Those values are regenerated from the freshly built bottles when you add the `pr-pull` label in the next step.

6. Add the `pr-pull` label to the PR. This will run some final tests and merge the PR if successful.
