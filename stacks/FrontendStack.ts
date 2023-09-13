import { StaticSite, StackContext, use } from "sst/constructs";
import { ApiStack } from "./ApiStack";

export function FrontendStack({ stack }: StackContext) {

  const {api} = use(ApiStack);
  
  // Deploy our React app
  const site = new StaticSite(stack, "ReactSite", {
    path: "packages/frontend",
    buildCommand: "npm run build",
    buildOutput: "build",
    environment: {
      REACT_APP_API_URL: api.url,
    },
  });

  // Show the URLs in the output
  stack.addOutputs({
    SiteUrl: site.url,
    ApiEndpoint: api.url,
  });
}
