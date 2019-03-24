mkdir data && mkdir data/config # Make data dir, config dir
echo '{"alloc":{"e3891ace0bce06b4acaddcbe47afecdbdcae1fb6": 100000}, "identifier": "main_net", "network": 0}' > data/config/config_main_net.json # Create Polaris monetary supply config
chmod +x ./go-polaris # Allow run
./go-polaris --network main_net --bootstrap-address localhost # Run polaris without an internet connection!
