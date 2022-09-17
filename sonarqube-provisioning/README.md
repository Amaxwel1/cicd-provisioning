# SonarQube Provision

## Informations
- **Default credentials are:**
  - **User:** admin
  - **Password:** admin

## Kustomize Provisioning:

### Deploy With Default Configurations
    
    oc new-project oqss-cicd
    git clone https://github.com/davidsf026/nexus-provisioning/
    oc apply -k ./nexus-provisioning/kustomize/base
    
### Deploy With Custom Configurations
1. Clone this repository:
		
		git clone https://github.com/redhat-oraex/cicd-provisioning/

2. Go to the directory `cicd-provisioning/nexus-provisioning/kustomize/overlays/custom`
		
		cd cicd-provisioning/nexus-provisioning/kustomize/overlays/custom

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

  5. To Do

## Deploy With OC Commands

    oc new-project oqss-cicd
    oc import-image dferreira/sonarqube:7.9.1 --from=quay.io/dferreira/sonarqube:7.9.1 --confirm

## To Do:
- Bring SonarQube to a newer version containerized in a UBI image.
	- **Desired Version:** https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.6.1.59531.zip
	-  **Base Image:** UBI8.
