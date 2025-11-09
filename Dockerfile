FROM dolfinx/dolfinx:stable

WORKDIR /app
COPY . .

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git \
    wget \
    curl \
    ca-certificates \
    cmake && \
    rm -rf /var/lib/apt/lists/*
RUN pip install tqdm meshio
# Install your package
RUN pip install --upgrade pip setuptools wheel
RUN pip install ./polyhedral_splines
RUN pip install jupyterlab

CMD ["/bin/bash"]

