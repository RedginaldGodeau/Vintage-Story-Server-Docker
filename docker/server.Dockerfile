FROM mcr.microsoft.com/dotnet/runtime:8.0

ARG BASE_PATH="/home/vintagestory"
ARG VS_PATH=${BASE_PATH}"/server"
ARG DATA_PATH=${BASE_PATH}"/data"

ENV VS_PATH=${VS_PATH}
ENV DATA_PATH=${DATA_PATH}

RUN apt-get update && apt-get install procps wget screen -y && rm -rf /var/lib/apt/lists/*

RUN useradd vintagestory -s /bin/bash -m

RUN mkdir -p ${VS_PATH} ${DATA_PATH}
RUN chown -R vintagestory:vintagestory ${BASE_PATH}
RUN chmod -R 755 ${BASE_PATH}

USER vintagestory
WORKDIR ${VS_PATH}
EXPOSE 42420

ENTRYPOINT ["/bin/bash", "-c", "screen -dmS vintagestory ./VintagestoryServer --dataPath=\"$DATA_PATH\" \"$@\"; bash"]