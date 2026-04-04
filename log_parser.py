def count_log_levels(file_path):
    counts = {"ERROR": 0, "WARNING":0}

    with open(file_path, 'r') as file:
        for line in file:
            if "ERROR" in line.upper():
                counts["ERROR"] += 1
            elif "WARNING" in line.upper():
                counts["WARNING"] += 1

    return counts

log_results = count_log_levels('/var/log/syslog')
print(f"Errors: {log_results['ERROR']}, Warnings: {log_results['WARNING']}")
