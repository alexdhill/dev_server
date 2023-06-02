# Get base pandoc install
FROM pandoc/minimal:latest-ubuntu as pandoc

# Get VSCode
FROM lscr.io/linuxserver/code-server:latest

# Def image
LABEL name="alexdhill/vscode" \
    version="1.2.0" \
    description="Multipurpose developer suite with VSCode. Includes C++, Python/Jupyter, R/Rmarkdown, and LaTeX support" \
    author="Alex D Hill"

# Install python3, r, and tex compilers
RUN echo "Installing Ubuntu libraries" && \
    apt-get update && \
    apt-get install -y \
	curl git \
	python3 pip python3-venv \
	r-base libxml2-dev libssl-dev libfontconfig1-dev \
	texlive-latex-extra latexmk && \
    rm -rf /var/lib/apt/lists/*

# Install pandoc and latex
RUN echo "Adding pandoc"
COPY --from=pandoc /usr/local/bin/pandoc /usr/bin/pandoc
COPY --from=pandoc /usr/lib/x86_64-linux-gnu/liblua* /usr/lib/x86_64-linux-gnu/

# Add VSCode config
RUN echo "Adding VSCode config files" && \
	mkdir /config/R /config/R/site-library
ADD settings.json /config/data/User/settings.json
ADD packages/ /packages/

# Install all libs
ENV R_LIBS_USER=/config/R/site-library
RUN cat /packages/vsc_extensions.txt | \
	xargs -L 1 /app/code-server/bin/code-server \
	--extensions-dir /config/extensions --install-extension && \
	python3 -m pip install --no-cache-dir --upgrade pip && \
	cat /packages/py_packages.txt | \
	xargs -L 1 python3 -m pip install --no-cache-dir && \
	R -f /packages/r_packages.R && \
	rm -rf /packages/
