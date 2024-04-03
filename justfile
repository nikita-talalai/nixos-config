# https://just.systems/man/en/chapter_19.html

default:
  @just --list

io:
  nix flake metadata
  nix flake show

update:
  nix flake update

lint:
  nix fmt

check:
  nix flake check

dev:
  nix develop

build: lint check
  nix build

clean:
  rm -f ./result

run: lint check
  nix run
