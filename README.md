# dbt_cloud_run_cost

This package contains one macro that will calculate the cost of successfully created models if they were run via dbt Cloud.

## Installation

Add the following to your `packages.yml` file:

```yaml
packages:
  - package: danthelion/dbt_cloud_run_cost
    version: ["0.3.0"]
```

## Usage

Call the macro as a post-hook in your `dbt_project.yml` file:

```yaml
on-run-end:
  - "{{ dbt_cloud_run_cost.calculate_run_cost(results) }}"
```

This is how it will look like after you run a job:

```bash
08:30:51  
08:30:51  Running 1 on-run-end hook
08:30:51
08:30:51  This run cost you $0.78 based on 78 successully run models.
08:30:51
08:30:51  1 of 1 START hook: analytics.on-run-end.0 ......................... [RUN]
08:30:51  1 of 1 OK hook: analytics.on-run-end.0 ............................ [OK in 0.00s]
08:30:51  
08:30:51  
08:30:51  Finished running 22 view models, 56 table models, 18 tests, 1 hook in 0 hours 10 minutes and 34.38 seconds (634.38s).
08:30:51  
08:30:51  Completed successfully
08:30:51  
08:30:51  Done. PASS=96 WARN=0 ERROR=0 SKIP=0 TOTAL=96
```
