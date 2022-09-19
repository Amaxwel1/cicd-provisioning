# SonarQube Provision

## Informations:
- **Default credentials are:**
  - **User:** admin
  - **Password:** admin

## Deploy With OC Commands:

### Deploy With Default Configurations:

    oc new-project oqss-cicd
    git clone https://github.com/davidsf026/cicd-provisioning/
    oc new-app -f ./sonarqube-provisioning/oc-provisioning/template.yaml

### Deploy With Custom Configurations:

1. Open the template file in a text editor, which is located in `cicd-provisioning/sonarqube-provisioning/oc-provisioning/template.yaml`
2. Make your changes in `parameters` section and save the file.

       parameters:
       - displayName: PostgreSQL PVC Size
         value: 15Gi
         name: POSTGRESQL_PVC_SIZE
       - displayName: SonarQube Deployment Image
         value: sonarqube:9.3-community
         name: SONARQUBE_DEPLOYMENT_IMAGE
       - displayName: SonarQube PVC Size
         value: 20Gi
         name: SONARQUBE_PVC_SIZE

3. And now you just need to the deploy the template file.

       oc new-project oqss-cicd
       git clone https://github.com/davidsf026/cicd-provisioning/
       oc new-app -f ./sonarqube-provisioning/oc-provisioning/template.yaml

## Deploy With Kustomize:

### Deploy With Default Configurations:
    
    oc new-project oqss-cicd
    git clone https://github.com/redhat-oraex/cicd-provisioning
    oc apply -k ./sonarqube-provisioning/kustomize-provisioning/overlays/base
    
### Deploy With Custom Configurations:
1. Clone this repository:
		
       git clone https://github.com/redhat-oraex/cicd-provisioning/

2. Go to the directory `cicd-provisioning/sonarqube-provisioning/kustomize-provisioning/overlays/custom`
		
       cd cicd-provisioning/sonarqube-provisioning/kustomize/overlays/custom

3. In this directory will be the following files:

       kustomization.yaml
       postgresql-pvc-size.yaml
       sonarqube-deployment-image.yaml
       sonarqube-pvc-size.yaml

4. Let's say I want to change the size of SonarQube PersistentVolumeClaim to 20Gi. To do this I need to modify "sonarqube-pvc-size.yaml", and it contains:

       kind: PersistentVolumeClaim
       apiVersion: v1
       metadata:
         name: sonarqube-sonarqube
       spec:
         resources:
           requests:
             storage: "12Gi"

4. So I just change storage value from "12Gi" to "20Gi". And that's It, now you just need to deploy SonarQube and it will be deployed with your custom configuration.

       kind: PersistentVolumeClaim
       apiVersion: v1
       metadata:
         name: sonarqube-sonarqube
       spec:
         resources:
           requests:
             storage: "20Gi"

4. To deploy with your custom configuration you need to reference the desired overlay directory, which in that is "custom".

       oc new-project oqss-cicd
       oc apply -k ./sonarqube-provisioning/kustomize/overlays/custom
    
## To Do:
- Bring SonarQube to a newer version containerized in a UBI image.
	- **SonarQube Desired Version:** https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.6.1.59531.zip
