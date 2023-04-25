# Get VSCode
FROM lscr.io/linuxserver/code-server:latest

# Install python3, r, and tex compilers
RUN echo "Installing Ubuntu libraries" && \
    apt-get update && \
    apt-get install -y \
	git \
    rm -rf /var/lib/apt/lists/*

# Add VSCode config
RUN echo "Adding VSCode config files" && \
	mkdir /config/R /config/R/site-library
ADD settings.json /config/data/User/settings.json
ADD packages/ /packages/

# Install all libs
RUN cat /packages/vsc_extensions.txt | \
	xargs -L 1 /app/code-server/bin/code-server \
	--extensions-dir /config/extensions --install-extension && \
	rm -rf /packages/
