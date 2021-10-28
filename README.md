# Workflows

Where the workflows & Dockerfile and start.sh files of all services are.


PAT ( Personal Access Token is needed ) github variables has to be set for Github Actions.


#### For Ci/Cd application deployment ( pipeline definition )

See .github/workflows/main_sync_workflows.yml

```  REPOSITORIES: |
    callruby/ruby-apps-code-1@dev
    callruby/ruby-apps-code-1@develop
    callruby/ruby-apps-code-2@dev
    callruby/ruby-apps-code-2@develop
    callruby/account-service@dev
    callruby/activity-service@dev
    callruby/backsync-service@dev
    callruby/callcontrol-service@dev
    callruby/cic-webapi@dev
    callruby/clio-service@dev
    callruby/cliogrow-service@dev
    callruby/customer-api@dev
    callruby/dashlight-backend@dev
    callruby/dashlight@dev
    callruby/datasync-service@dev
    callruby/employeedirectory-service@dev
    callruby/force-frontend@dev
    callruby/grasshopper-service@dev
    callruby/identity-service@dev
    callruby/notification-service@dev
    callruby/partner-api@dev
    callruby/partner-integration-service@dev
    callruby/pco-service@dev
    callruby/prl-authentication-service@dev
    callruby/prl-frontend@dev
    callruby/prl-webapi@dev
    callruby/professional-chats@dev
    callruby/rocketmatter-service@dev
    callruby/ros-frontend@dev
    callruby/ros-webapi@dev
    callruby/rossupport-service@dev
    callruby/rubyexp-webapi@dev
    callruby/salesforce-service@dev
    callruby/servicehandling-service@dev
    callruby/stripe-service@dev
    callruby/zuora-frontend@dev
    callruby/zuora-service@dev
 ```
 That's the place to add new backend repositories
 
 ```
  WORKFLOW_FILES: |
    main.yml=main.yml
    main_pr_closed.yaml=main_pr_closed.yaml
    main_pr_open.yml=main_pr_open.yml
    clean_workflows.yaml=clean_workflows.yaml
    issue_comments.yaml=issue_comments.yaml
   ``` 
   
#### For Vault & Terraform repositories

See .github/workflows/main_sync_workflows_consul_vault.yml

```
  REPOSITORIES: |
    callruby/ruby-apps-consul-vault@master
 ```
 Here's the place to add the repositories where it has to be synced
 
 ```
  WORKFLOW_FILES: |
    terraform_consul_vault.yml=terraform_consul_vault.yml
   ``` 
   
That's the place to select the workflow files that has to be synced
 


#### For Each application Dockerfile confd/start.sh

See .github/workflows/main_sync_APPLICATION_NAME.yml

```
  REPOSITORIES: |
    callruby/APPLICATION_NAME@dev
 ```
 Here's the place to add the repositories where it has to be synced
 
 ```
  WORKFLOW_FILES: |
    Dockerfile-APPLICATION_NAME=Dockerfile
    start-APPLICATION_NAME.sh=APPLICATION_PATH/confd/start.sh
   ``` 
   
That's the place to select the workflow files that has to be synced



## For updating the Dockerfile or confd/start.sh files for each service, the deployment has to be made manually from Actions.

Be Aware of this .

