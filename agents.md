# agents.md — update-testing

## Repository Overview

CI pipeline definitions for automated upgrade testing of ownCloud Server. Runs on Drone CI to validate that server upgrades between versions complete successfully.

- **Classification:** Infrastructure / Tooling
- **Activity Status:** Active
- **License:** No license detected
- **Language:** Shell

## Architecture & Key Paths

- `README.md` — Repository description with link to Drone CI

This is a minimal repository. The primary content is Drone CI pipeline configuration.

## Development Conventions

- Drone CI pipeline definitions
- Shell scripts for upgrade testing automation

## Build & Test Commands

No local build or test commands. All testing runs on Drone CI at https://drone.owncloud.com/owncloud/update-testing.

## Important Constraints

- **No license file detected:** The OSPO is formalizing the license status.
- **Copyleft + Apache 2.0 migration:** The OSPO license migration strategy applies to all ownCloud repositories.
- **Drone CI dependency:** Pipeline definitions require Drone CI infrastructure.


## OSPO Policy Constraints

### GitHub Actions
- **Only** use actions owned by `owncloud`, created by GitHub (`actions/*`), verified on the GitHub Marketplace, or verified by the ownCloud Maintainers.
- Pin all actions to their full commit SHA (not tags): `uses: actions/checkout@<SHA> # vX.Y.Z`
- Never introduce actions from unverified third parties.

### Dependency Management
- Dependabot is configured for automated dependency updates.
- Review and merge Dependabot PRs as part of regular maintenance.
- Do not introduce new dependencies without discussion in an issue first.

### Git Workflow
- **Rebase policy**: Always rebase; never create merge commits. Use `git pull --rebase` and `git rebase` before pushing.
- **Signed commits**: All commits **must** be PGP/GPG signed (`git commit -S -s`).
- **DCO sign-off**: Every commit needs a `Signed-off-by` line (`git commit -s`).
- **Conventional Commits & Squash Merge**: Use the [Conventional Commits](https://www.conventionalcommits.org/) format where the repository enforces it. Many repos use squash merge, where the PR title becomes the commit message on the default branch — apply Conventional Commits format to PR titles as well. A reusable GitHub Actions workflow enforces this.

## Context for AI Agents

- This repository contains CI pipeline definitions, not application code.
- Testing runs on Drone CI against ownCloud Server tarballs.
- The pipelines validate upgrade paths between different ownCloud Server versions.
