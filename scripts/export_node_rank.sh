# Get the hostname
hostname=$(hostname)

# Define the mapping of hostname to NODE_RANK
declare -A hostname_to_node_rank
hostname_to_node_rank["nlp-sft-worker-0"]=0
hostname_to_node_rank["nlp-sft-worker-1"]=1

# Get the corresponding NODE_RANK based on the hostname
node_rank=${hostname_to_node_rank[$hostname]}

# If the hostname is not in the mapping, set NODE_RANK to a default value (e.g., -1)
if [ -z "$node_rank" ]; then
    node_rank=-1
fi

# Export NODE_RANK as an environment variable
export NODE_RANK=$node_rank

