include .env

release:
	GITHUB_TOKEN=${GITHUB_TOKEN} npx semantic-release
