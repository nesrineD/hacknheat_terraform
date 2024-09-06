# Setup

A step by step guide to setup GitHub + TF + GCP:

## 1. Create a Terraform Cloud workspace and link it to you GitHub repository

![](./screenshots/tfe_org.png)
![](./screenshots/tfe_vcs.png)
![](./screenshots/tfe_repo.png)

## 2. Connect TF workspace via WIF to GCP project

To connect the TF workspace with WIF to GCP add the following env vars to the workspace:

TODO: Add service account and identity pool
- `TFC_GCP_PROVIDER_AUTH`: `true`
- `TFC_GCP_RUN_SERVICE_ACCOUNT_EMAIL`: the service account that was granted access in the WIF pool
- `TFC_GCP_WORKLOAD_PROVIDER_NAME`: `projects/senacor-hack-and-heat-2024/locations/global/workloadIdentityPools/[IDENTITY-POOL]/providers/[PROVIDER-NAME]`

## 3. Configure WIF Pool, Provider and Service Account to use (provided by workshop team)

- The Token structure of the Terraform workload identity token (filter in GCP WIF pool as you like)

```
{
  "jti": "1192426d-b525-4fde-9d42-f238be437bbd",
  "iss": "https://app.terraform.io",
  "aud": "my-example-audience",
  "iat": 1650486122,
  "nbf": 1650486117,
  "exp": 1650486422,
  "sub": "organization:my-org:project:Default Project:workspace:my-workspace:run_phase:apply",
  "terraform_organization_id": "org-GRNbCjYNpBB6NEH9",
  "terraform_organization_name": "my-org",
  "terraform_project_id": "prj-vegSA59s1XPwMr2t",
  "terraform_project_name": "Default Project",
  "terraform_workspace_id": "ws-mbsd5E3Ktt5Rg2Xm",
  "terraform_workspace_name": "my-workspace",
  "terraform_full_workspace": "organization:my-org:project:Default Project:workspace:my-workspace",
  "terraform_run_id": "run-X3n1AUXNGWbfECsJ",
  "terraform_run_phase": "apply"
}
```
1. Create a Provider Pool and add the Terraform provider to the pool:

![](./screenshots/identity_pool.png)

1. Connect a service account to the pool and restrict access to certain workspaces only using the fields from the token above.
