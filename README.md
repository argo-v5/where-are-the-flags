# where-are-the-flags

Dockerfile that generates an Ubuntu image with a variety of tools useful for CTFs.

Feel free to recommend adding more software.

## TODO
- [x] Add tools from training.olicyber.it
- [x] Elaborate README with commands for building and using with Distrobox
- [x] Automatic builds
- [ ] Similar project but using Nix

---

## USAGE
Using GitHub Workflows and the Dockerfile an image is built periodically which you may use in Docker, Podman, Distrobox and so on and so on.

**Many programs are located in /opt/ctf**
### Distrobox
```
mkdir ~/Flag
distrobox create -n flag -i ghcr.io/argrat/where-are-the-flags:main -H ~/Flag/
distrobox enter flag
```
### Docker/Podman
```
docker/podman pull ghcr.io/argrat/where-are-the-flags:main
# Then do whatever you want with it
```

---

##### What's up with the name? Why did you make this?
A friend kept bugging me about training in CTFs by asking me "So, where are the flags?" all the time.

At the time I made excuses such as "I want to make a reproducible environment for it but I feel like Nix gets in the way of my productivity" to which I then had this idea.

I left it unfinished for a few months as I had moved on to other projects but recently picked it up again, and decided to publish it like this.

I hope this excuse-killer can be useful to other chronic procrastinators like me. uwu
