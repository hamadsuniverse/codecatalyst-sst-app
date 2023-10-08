# Sample React.js SST app

An example full-stack serverless React.js app created with SST, that uses Structurizr for documentation management of archtectural diagrams, docs and archtectural decisions capture using Architecture decision records (ADRs).

This sample also includes Amazon CodeCatalyst workflow (CD pipeline) to deploy changes to main branch to aws automatically.

## After cloning

```
npm install
npm run dev
```

To install dependencies and run your own development environment of the app.

## Commands

### `npm run dev`

Starts the Live Lambda Development environment.

### `npm run build`

Build your app and synthesize your stacks.

### `npm run deploy [stack]`

Deploy all your stacks to AWS. Or optionally deploy, a specific stack.

### `npm run remove [stack]`

Remove all your stacks and all of their resources from AWS. Or optionally removes, a specific stack.

### `npm run structurizr`

Run structurizr lite docker locally on port 8080, so you can access structurizr at [http://localhost:8080](http://localhost:8080).

## Documentation

Learn more.

- [SST Docs](https://docs.sst.dev/)
- [sst](https://docs.sst.dev/packages/sst)
- [structurizr DSL](https://docs.structurizr.com/dsl)
- [structurizr Lite](https://docs.structurizr.com/lite)
- [adr-tools](https://github.com/npryce/adr-tools)
- [dbdocs](https://dbdocs.io/docs) (Used to host DB documentation.)

