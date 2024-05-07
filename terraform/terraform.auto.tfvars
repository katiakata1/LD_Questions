rg_name = "LD_rg"
location = "UK South"

// Tfstate storage account 
tfstate_sa_name = "ldquestionstfstatesa"
tfstate_container_name = "tfstate"


// Database configuration
sql_server_name = "ldquestionssqlserver"
sql_server_version = "12.0"
sql_db_name = "ld_sql_db"
db_collation = "Cyrillic_General_CI_AS"


// Deploying Container App
container_logs_name = "container-logs"
container_logs_sku = "PerGB2018"
container_app_env_name = "container-app-env"
container_app_revision_mode = "Single"
container_app_name = "container-app"
image_name = "bujanobujanovakatia/ld-questions:latest"
container_cpu = "0.5"
container_memory = "1.5"
container_name = "ld-questions-web"
