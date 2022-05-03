# Workflows & Dockerfiles and scripts of all services are located.

### Why ?

    Because we need to have the control and facility to update the Dockerfile and workflows at demand
    These Dockerfile are used on the Github Action pipeline's

### Differences with the application repository Dockerfiles

```
We dont want to interrupt Development work

and we need to update the Dockerfile's the fastest possible

Currently we have Sonarqube on the Dockerfile's  and also we have the build,unit test process on the Dockerfile

the dockerfile are written in way to be run on the root path of the repository

Some of Dockerfile needs secrets or certificates in order to be used

These Dockerfiles uses Sonarqube , that require some network connectivity ( For ex. The vpn has to be always on )

Usually you have a Dockerfile for the CI/CD and other named for example Dockerfile.dev for the local development.
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

See .github/workflows/main_sync_APP_NAME.yml

```  
  REPOSITORIES: |
    callruby/APP_NAME@BRANCH    
 ```
 That's the place to add new backend repositories
 
 ```
  WORKFLOW_FILES: |
    main_feature_branch.yaml=main_feature_branch.yaml
    main_manual_ecr_checks_reusable.yaml=main_manual_ecr_checks_reusable.yaml
    use_clean_workflows_reusable.yaml=use_clean_workflows_reusable.yaml
    use_issue_comments_reusable.yaml=use_issue_comments_reusable.yaml
    use_main_external_dockerfile_reusable.yaml=use_main_external_dockerfile_reusable.yaml
    use_main_pr_labels_reusable.yaml=use_main_pr_labels_reusable.yaml
    use_clean_old_commits_reusable.yaml=use_clean_old_commits_reusable.yaml
    main_prod_manual_tag.yaml=main_prod_manual_tag.yaml
   ``` 
  

## For updating the pipeline files for each service, the deployment has to be made manually from Actions.

Be Aware of this .



## Act 

Run your GitHub Actions locally

    https://github.com/nektos/act

How to execute it

    act lintAllTheThings
