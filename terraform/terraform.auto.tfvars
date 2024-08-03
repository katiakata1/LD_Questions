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

db_firewall_rule_name = "ContainerAppIP"


// Deploying Container App
container_logs_name = "container-logs"
container_logs_sku = "PerGB2018"
container_app_env_name = "container-app-env"
container_app_revision_mode = "Single"
container_app_name = "container-app"
image_name = "bujanovakatia/ld-questions:v1.0.1"
container_cpu = "0.5"
container_memory = "1Gi"
container_name = "ld-questions-web"

container_port = "5000"
container_ip = "Public"

min_app_replica = 1
max_app_replica = 3

app_rule_name_scale_up = "cpu-scale-up"
app_rule_type = "cpu"


app_rule_scale_up_operator = "GreaterThan"
app_rule_scale_up_threshold = "80"
app_rule_scale_up_direction = "Increase"
app_rule_scale_up_cooldown = "60s"

app_rule_name_scale_down = "cpu-scale-down"
app_rule_scale_down_operator = "LessThan"
app_rule_scale_down_threshold = "20"
app_rule_scale_down_direction = "Decrease"
app_rule_scale_down_cooldown = "60s"

// This is the port exposed on the container inside container app
target_port = "5000"


// Monitoring
app_insights_name = "Container-app-insights"
