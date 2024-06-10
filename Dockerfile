# Use an appropriate base image
FROM ubuntu:20.04

# Install necessary packages
RUN apt-get update && apt-get install -y \
    fortune-mod \
    cowsay \
    netcat \
    && rm -rf /var/lib/apt/lists/*

# Copy the wisecow script
COPY wisecow.sh /usr/local/bin/wisecow.sh

# Make the script executable
RUN chmod +x /usr/local/bin/wisecow.sh

# Ensure /usr/games is included in the PATH
ENV PATH="/usr/games:${PATH}"

# Expose the port that the app runs on
EXPOSE 4499

# Command to run the app
CMD ["/usr/local/bin/wisecow.sh"]
