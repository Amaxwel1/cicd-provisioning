# Sonarqube Provision

## Informations
- **Desired Version:** https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.6.1.59531.zip
- Default credentials are:
  - **User:** admin
  - **Password:** admin123

## Image:
- **Image in Quay.io:** quay.io/dferreira/sonarqube
- **Version (latest at 2022-09-13):** 7.9.1

## Deploy With Kustomize:

    oc new-project oqss-cicd
    git clone https://github.com/davidsf026/nexus-provisioning/
    oc apply -k ./nexus-provisioning/kustomize

## Deploy With OC Commands

    oc new-project oqss-cicd
    oc import-image dferreira/sonarqube:7.9.1 --from=quay.io/dferreira/sonarqube:7.9.1 --confirm
		
