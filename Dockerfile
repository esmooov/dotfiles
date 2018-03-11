FROM ubuntu:xenial

ARG user=nate-wilkins
# TODO: support for passing in secrets.
ARG skip_encrypted=yes

RUN apt-get update                     && \
    apt-get install -y build-essential && \
    apt-get install -y git             && \
    apt-get install -y curl            && \
    apt-get install -y python

# setup user.
RUN echo "User: $user"
RUN useradd -ms /bin/bash $user

# setup nvm.
RUN runuser -l $user -c "curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash"
RUN chmod +x "/home/$user/.nvm/nvm.sh"
RUN runuser -l $user -c ". /home/$user/.nvm/nvm.sh && nvm install 9.7.1"

WORKDIR "/home/$user"
ADD . "/home/$user/.dotfiles"
RUN chown -R $user:$user ./.dotfiles

RUN chmod +x ./.dotfiles/install.sh && /bin/bash ./.dotfiles/install.sh --user $user --skip-encrypted

CMD ["/bin/bash"]
