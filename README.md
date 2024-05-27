# 2009Scape-SelfHosted
Project to make 2009Scape more self hosting friendly.

# Volumes
* **/app/worldprops/**: This is the directory where world property files will be loaded.
* **/app/data/**: All the data used by 2009Scape.
* **/app/data/configs/**: Configuration files for the game.

# Environment Variables
* **WORLD_CONFIG_FILE**: This is the World configuration file to load. File must be located in _/app/Worldprops_.
  * Default: default.conf
* **KEEP_ALIVE**: If this is set to true it will cause the container to run top keeping the container up for troubleshooting.

# Configuration Files
## World Properites
Configuration File to configurat the world you host. Example available at _resources/worldprops/default.conf_ 
### Database
This must match the database configurations you set in your docker file (or point to an active Mysql server).
