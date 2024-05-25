# 2009Scape-SelfHosted
Project to make 2009Scape more self hosting friendly.

# Volumes
* **/app/worldprops/**: This is the directory where world property files will be loaded.

# Environment Variables
* **WORLD_CONFIG_FILE**: This is the World configuration file to load. File must be located in _/app/Worldprops_.
  * Default: default.conf

# Configuration Files
## World Properites
Configuration File to configurat the world you host. Example available at _resources/worldprops/default.conf_ 
### Database
This must match the database configurations you set in your docker file (or point to an active Mysql server).
