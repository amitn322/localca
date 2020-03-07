# localca
This repo contains two scripts.
  - createCA.sh 
    This script is used to create the initial CA cert. Once you create the CA cert, import the cert into your device and keep the Cert and 
    Key Safe. 
    ```
    sh createCA.sh 
    ```
  - createCert.sh 
    This script is used to generate certificates for your domains in future. 
    ```
    createCert.sh
    ```
