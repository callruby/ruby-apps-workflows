# Workflows

Where the workflows of the backend services are updated.

Every time that a change is made on master a workflows runs that basically open PR's on the backend repositories to update the workflow files.


PAT ( Personal Access Token is needed ) github variables has to be set for Github Actions.

For Ci/Cd application deployment

See .github/workflows/main_sync_workflows.yml

```
  REPOSITORIES: |
    callruby/ruby-apps-code-1@dev
    callruby/ruby-apps-code-1@develop
    callruby/ruby-apps-code-2@dev
    callruby/ruby-apps-code-2@develop
 ```
 That's the place to add new backend repositories
 
 ```
  WORKFLOW_FILES: |
    main.yml=main.yml
    main_checks.yml=main_checks.yml
    main_pr_closed.yaml=main_pr_closed.yaml
    main_pr_open.yml=main_pr_open.yml
   ``` 
   
For Vault & Terraform repositories

See .github/workflows/main_sync_workflows_consul_vault.yml

```
  REPOSITORIES: |
    callruby/ruby-apps-consul-vault@master
 ```
 That's the place to add new backend repositories
 
 ```
  WORKFLOW_FILES: |
    terraform_consul_vault.yml=terraform_consul_vault.yml
   ``` 
   
That's the place to select the workflow files that has to be synced
 
