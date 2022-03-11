# Workflows & Dockerfiles and scripts of all services are located.

### Why ?

    Because we need to have the control and facility to update the Dockerfile and workflows at demand

### Differences with the application repository Dockerfiles

```
We dont want to interrupt Development work

and we need to update the Dockerfile's the fastest possible

Currently we have Sonarqube on the Dockerfile's  and also we have the build,unit test process on the Dockerfile

the dockerfile are written in way to be run on the root path of the repository

Some of Dockerfile needs secrets or certificates in order to be used
```

#### Dockerfile Sonarqube Url change

```
#This is a internal Sonarqube URL only accessible from inside the kubernetes cluster

ARG SONAR_HOST_URL=http://sonarqube-sonarqube.default.svc.cluster.local:9000

#if you want to use one of these Dockerfile locally you must change it to

ARG SONAR_HOST_URL=http://sonarqube.devops.ruby.com:9000
```

PAT ( Personal Access Token is needed ) github variables has to be set for Github Actions.

# IMPORTANT
## EVERY TIME THAT A NEW WORKFLOW FILE IS ADDED/MODIFIED ON A REPOSITORY MUST BE ADDED HERE TOO


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



## For updating the pipeline files for each service, the deployment has to be made manually from Actions.

Be Aware of this .
