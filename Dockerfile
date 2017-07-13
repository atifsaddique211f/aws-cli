FROM    stakater/base-alpine
LABEL   authors="Atif Saddique <atif.saddique4@gmail.com>"

RUN     apk -Uuv add groff less python py-pip && \
        pip install --upgrade awscli && \
        apk --purge -v del py-pip && \
        rm /var/cache/apk/*

# Expose volume for AWS credentials
VOLUME  ["/root/.aws"]
# Expose the working directory
VOLUME 	["/aws"]

WORKDIR "/aws"